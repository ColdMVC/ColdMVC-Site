<cfset modelFactory = $.factory.get("modelFactory") />
<cfset markdownProcessor = $.factory.get("markdownProcessor") />
<cfset urlPath = $.config.get("urlPath") />
<cfset xml = fileRead(expandPath("/config/docs.xml")) />

<cfquery>
	truncate table annotation
	truncate table chapter
	truncate table helper
	truncate table plugin
	truncate table tag
</cfquery>

<cffunction name="getFileName">
	<cfargument name="path" />

	<cfreturn listFirst(listLast(path, "\"), ".") />

</cffunction>

<cffunction name="getContent">
	<cfargument name="directory" />
	<cfargument name="file" />

	<cfset var path = arguments.directory & arguments.file & ".txt" />

	<cfif not fileExists(path)>
		<cfset fileWrite(path, "") />
	</cfif>

	<cfreturn markdown(fileRead(path)) />

</cffunction>

<cffunction name="markdown">
	<cfargument name="text" />

	<cfif arguments.text neq "">
		<cfset arguments.text = replace(arguments.text, "]: /", "]: #urlPath#/", "all") />
		<cfset arguments.text = replaceTables(arguments.text) />
		<cfreturn markdownProcessor.markdown(arguments.text) />
	</cfif>

	<cfreturn arguments.text />

</cffunction>

<cffunction name="replaceTables">
	<cfargument name="text" />

	<cfif find("|", arguments.text)>

		<cfset var array = listToArray(arguments.text, chr(10)) />
		<cfset var i = "" />
		<cfset var j = "" />
		<cfset var insideTable = false />
		<cfset var line = "" />
		<cfset var table = [] />
		<cfset var cells = [] />
		<cfset var cell = "" />
		<cfset var insideBody = false />
		<cfset var rows = 0 />
		<cfset var headers = 0 />
		<cfset var start = 0 />
		<cfset var end = 0 />
		<cfset var tables = [] />
		<cfset var new = [] />

		<cfloop from="1" to="#arrayLen(array)#" index="i">

			<cfset line = array[i] />

			<cfif left(line, 1) eq "|">

				<cfif not insideTable>

					<cfset start = i />

					<cfset table = [] />
					<cfset arrayAppend(table, "<table>") />
					<cfset arrayAppend(table, "<thead>") />
					<cfset arrayAppend(table, "<tr>") />

					<cfset cells = listToArray(line, "|") />

					<cfloop array="#cells#" index="cell">
						<cfif trim(cell) neq "">
							<cfset headers = headers + 1 />
							<cfset arrayAppend(table, "<th>#trim(cell)#</th>") />
						</cfif>
					</cfloop>

					<cfset arrayAppend(table, "</tr>") />
					<cfset arrayAppend(table, "</thead>") />

				<cfelse>

					<cfif rows neq 0>

						<cfif not insideBody>
							<cfset arrayAppend(table, "<tbody>") />
							<cfset insideBody = true />
						</cfif>

						<cfset arrayAppend(table, "<tr>") />

						<cfset cells = listToArray(line, "|") />

						<cfloop from="1" to="#headers#" index="j">
							<cfset arrayAppend(table, "<td>#trim(cells[j])#</td>") />
						</cfloop>

						<cfset arrayAppend(table, "</tr>") />

					</cfif>

					<cfset rows = rows + 1 />

				</cfif>

				<cfset insideTable = true />

			<cfelse>

				<cfif insideTable>

					<cfset arrayAppend(table, "</tbody>") />
					<cfset arrayAppend(table, "</table>") />

					<cfset arrayAppend(tables, {
						start = start,
						end = i - 1,
						array = table
					}) />

				</cfif>

				<cfset insideTable = false />
				<cfset insideBody = false />
				<cfset insideBody = 0 />
				<cfset headers = 0 />

			</cfif>

		</cfloop>

		<!--- in case the loop ending inside a table --->
		<cfif insideTable>

			<cfset arrayAppend(table, "</tbody>") />
			<cfset arrayAppend(table, "</table>") />

			<cfset arrayAppend(tables, {
				start = start,
				end = i - 1,
				array = table
			}) />

		</cfif>

		<cfset new = [] />
		<cfset start = 1 />
		<cfset end = 0 />

		<cfloop array="#tables#" index="table">

			<cfif table.start gt start>

				<cfloop from="1" to="#table.start-1#" index="i">
					<cfset arrayAppend(new, array[i]) />
				</cfloop>

			</cfif>

			<cfloop array="#table.array#" index="line">
				<cfset arrayAppend(new, line) />
			</cfloop>

			<cfset start = table.end />
			<cfset end = table.end + 1 />

		</cfloop>

		<cfif end lt arrayLen(array)>

			<cfloop from="#end#" to="#arrayLen(array)#" index="i">
				<cfset arrayAppend(new, array[i]) />
			</cfloop>

		</cfif>

		<cfset arguments.text = arrayToList(new, chr(10)) />

	</cfif>

	<cfreturn arguments.text />

</cffunction>

<!--- annotations --->
<cfset _Annotation = modelFactory.get("Annotation") />
<cfset annotations = $.array.toStruct(_Annotation.list(), "name") />
<cfset annotationXML = xmlSearch(xml, "sections/section[@id='annotations']/pages/page") />

<cfloop from="1" to="#arrayLen(annotationXML)#" index="i">

	<cfset name = annotationXML[i].xmlAttributes.id />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/coldsite/docs/annotations/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfif not structKeyExists(annotations, name)>

		<cfset annotation = _Annotation.new({
			name = name,
			description = getContent(d, "description"),
			example = getContent(d, "example"),
			slug = slug
		}) />

		<cfset annotation.save(false) />

	</cfif>

</cfloop>

<!--- chapters --->
<cfset _Chapter = modelFactory.get("Chapter") />
<cfset chapters = $.array.toStruct(_Chapter.list(), "name") />
<cfset chapterXML = xmlSearch(xml, "sections/section[@id='chapters']/pages/page") />

<cfloop from="1" to="#arrayLen(chapterXML)#" index="i">

	<cfset name = chapterXML[i].xmlAttributes.id />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/coldsite/docs/chapters/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfif not structKeyExists(chapters, name)>

		<cfset chapter = _Chapter.new({
			name = name,
			description = getContent(d, "description"),
			content = getContent(d, "content"),
			slug = slug,
			order = i
		}) />

		<cfset chapter.save(false) />

	</cfif>

</cfloop>

<!--- helpers --->
<cfset _Helper = modelFactory.get("Helper") />
<cfset helpers = $.array.toStruct(_Helper.list(), "name") />
<cfset helperArray = directoryList(expandPath("/coldmvc/app/helpers")) />

<cfloop from="1" to="#arrayLen(helperArray)#" index="i">

	<cfset name = getFileName(helperArray[i]) />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/coldsite/docs/helpers/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfset f = expandPath("/coldsite/docs/helpers/#name#.txt") />

	<cfif fileExists(f)>
		<cfset fileDelete(f) />
	</cfif>

	<cfif not structKeyExists(helpers, name)>

		<cfset helper = _Helper.new({
			name = name,
			description = getContent(d, "description"),
			example = getContent(d, "example"),
			slug = slug,
			url = "https://github.com/tonynelson19/ColdMVC/blob/master/app/helpers/" & name & ".cfc"
		}) />

		<cfset helper.save(false) />

	</cfif>

</cfloop>

<!--- plugins --->
<cfset _Plugin = modelFactory.get("Plugin") />
<cfset plugins = $.array.toStruct(_Plugin.list(), "name") />
<cfset pluginXML = xmlSearch(xml, "sections/section[@id='plugins']/pages/page") />

<cfloop from="1" to="#arrayLen(pluginXML)#" index="i">

	<cfset name = pluginXML[i].xmlAttributes.id />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/coldsite/docs/plugins/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfset f = expandPath("/coldsite/docs/plugins/#name#.txt") />

	<cfif fileExists(f)>
		<cfset fileDelete(f) />
	</cfif>

	<cfif not structKeyExists(plugins, name)>

		<cfset plugin = _Plugin.new({
			name = name,
			description = getContent(d, "description"),
			author = getContent(d, "author"),
			version = getContent(d, "version"),
			content = getContent(d, "content"),
			example = getContent(d, "example"),
			url = getContent(d, "url"),
			slug = slug
		}) />

		<cfset plugin.save(false) />

	</cfif>

</cfloop>

<!--- tags --->
<cfset _Tag = modelFactory.get("Tag") />
<cfset tags = $.array.toStruct(_Tag.list(), "name") />
<cfset tagArray = directoryList(expandPath("/coldmvc/app/tags")) />

<cfloop from="1" to="#arrayLen(tagArray)#" index="i">

	<cfset name = getFileName(tagArray[i]) />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/coldsite/docs/tags/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfset f = expandPath("/coldsite/docs/tags/#name#.txt") />

	<cfif fileExists(f)>
		<cfset fileDelete(f) />
	</cfif>

	<cfif not structKeyExists(tags, name)>

		<cfset tag = _Tag.new({
			name = name,
			description = getContent(d, "description"),
			example = getContent(d, "example"),
			parameters = getContent(d, "parameters"),
			slug = slug,
			url = "https://github.com/tonynelson19/ColdMVC/blob/master/app/tags/" & name & ".cfm"
		}) />

		<cfset tag.save(false) />

	</cfif>

</cfloop>

<cfset ormFlush() />