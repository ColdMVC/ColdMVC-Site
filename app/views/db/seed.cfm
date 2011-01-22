<cfset modelFactory = $.factory.get("modelFactory") />
<cfset markdownProcessor = $.factory.get("markdownProcessor") />
<cfset urlPath = $.config.get("urlPath") />

<cfquery>
	truncate table annotation
	truncate table chapter
	truncate table tag
</cfquery>

<cffunction name="getContent">
	<cfargument name="directory" />
	<cfargument name="file" />

	<cfset var path = arguments.directory & arguments.file />

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
<cfset annotationArray = _Annotation.list() />
<cfset annotations = $.array.toStruct(annotationArray, "name") />
<cfset xml = fileRead(expandPath("/config/docs.xml")) />
<cfset annotationXML = xmlSearch(xml, "sections/section[@id='annotations']/pages/page") />

<cfloop from="1" to="#arrayLen(annotationXML)#" index="i">

	<cfset name = annotationXML[i].xmlAttributes.id />

	<cfset d = expandPath("/coldsite/docs/annotations/#name#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfset f = expandPath("/coldsite/docs/annotations/#name#.txt") />

	<cfif fileExists(f)>
		<cfset fileDelete(f) />
	</cfif>

	<cfset description = getContent(d, "description.txt") />
	<cfset example = getContent(d, "example.txt") />

	<cfif not structKeyExists(annotations, name)>

		<cfset annotation = _Annotation.new({
			name = name,
			description = description,
			example = example,
			slug = $.string.slugify(name),
			order = i
		}) />

		<cfset annotation.save(false) />

	</cfif>

</cfloop>

<!--- chapters --->
<cfset _Chapter = modelFactory.get("Chapter") />
<cfset chapterArray = _Chapter.list() />
<cfset chapters = $.array.toStruct(chapterArray, "name") />
<cfset xml = fileRead(expandPath("/config/docs.xml")) />
<cfset chapterXML = xmlSearch(xml, "sections/section[@id='chapters']/pages/page") />

<cfloop from="1" to="#arrayLen(chapterXML)#" index="i">

	<cfset name = chapterXML[i].xmlAttributes.id />

	<cfset d = expandPath("/coldsite/docs/chapters/#name#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfset f = expandPath("/coldsite/docs/chapters/#name#.txt") />

	<cfif fileExists(f)>
		<cfset fileDelete(f) />
	</cfif>

	<cfset description = getContent(d, "description.txt") />
	<cfset content = getContent(d, "content.txt") />

	<cfif not structKeyExists(chapters, name)>

		<cfset chapter = _Chapter.new({
			name = name,
			description = description,
			content = content,
			slug = $.string.slugify(name),
			order = i
		}) />

		<cfset chapter.save(false) />

	</cfif>

</cfloop>

<!--- tags --->
<cfset _Tag = modelFactory.get("Tag") />
<cfset tagArray = _Tag.list() />
<cfset tags = $.array.toStruct(tagArray, "name") />
<cfset xml = fileRead(expandPath("/config/docs.xml")) />
<cfset tagXML = xmlSearch(xml, "sections/section[@id='tags']/pages/page") />

<cfloop from="1" to="#arrayLen(tagXML)#" index="i">

	<cfset name = tagXML[i].xmlAttributes.id />

	<cfset d = expandPath("/coldsite/docs/tags/#name#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfset f = expandPath("/coldsite/docs/tags/#name#.txt") />

	<cfif fileExists(f)>
		<cfset fileDelete(f) />
	</cfif>

	<cfset description = getContent(d, "description.txt") />
	<cfset parameters = getContent(d, "parameters.txt") />
	<cfset example = getContent(d, "example.txt") />

	<cfif not structKeyExists(tags, name)>

		<cfset tag = _Tag.new({
			name = name,
			description = description,
			example = example,
			parameters = parameters,
			slug = $.string.slugify(name),
			order = i
		}) />

		<cfset tag.save(false) />

	</cfif>

</cfloop>

<cfset ormFlush() />