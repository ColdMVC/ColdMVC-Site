<cfset modelFactory = $.factory.get("modelFactory") />
<cfset markdownProcessor = $.factory.get("markdownProcessor") />
<cfset urlPath =  />
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

	<cfreturn markdownProcessor.markdown(arguments.text) />

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