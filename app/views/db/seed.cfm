<cfset modelFactory = $.framework.getBean("modelFactory") />
<cfset markdownProcessor = $.factory.getBean("markdownProcessor") />
<cfset xml = fileRead(expandPath("/config/docs.xml")) />

<cfquery>
	truncate table annotation
	truncate table chapter
	truncate table helper
	truncate table plugin
	truncate table tag
</cfquery>

<cffunction name="getFileName" access="public" output="false" returntype="string">
	<cfargument name="path" required="true" type="string" />

	<cfreturn listFirst(listLast(path, "\"), ".") />

</cffunction>

<cffunction name="getContent" access="public" output="false" returntype="string">
	<cfargument name="directory" required="true" type="string" />
	<cfargument name="file" required="true" type="string" />
	<cfargument name="isHTML" required="false" default="true" type="boolean" />

	<cfset var path = arguments.directory & arguments.file & ".txt" />

	<cfif not fileExists(path)>
		<cfset fileWrite(path, "") />
	</cfif>

	<cfset var content = fileRead(path) />

	<cfif arguments.isHTML>
		<cfset content = markdown(content) />
	</cfif>

	<cfreturn content />

</cffunction>

<cffunction name="markdown" access="public" output="false" returntype="string">
	<cfargument name="text" required="true" type="string" />

	<cfreturn trim(markdownProcessor.markdown(arguments.text)) />

</cffunction>

<!--- annotations --->
<cfset _Annotation = modelFactory.getModel("Annotation") />
<cfset annotations = $.array.toStruct(_Annotation.list(), "name") />
<cfset annotationXML = xmlSearch(xml, "sections/section[@id='annotations']/pages/page") />

<cfloop from="1" to="#arrayLen(annotationXML)#" index="i">

	<cfset name = annotationXML[i].xmlAttributes.id />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/config/docs/annotations/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfif not structKeyExists(annotations, name)>

		<cfset annotation = _Annotation.new({
			name = name,
			description = getContent(d, "description"),
			example = getContent(d, "example"),
			overview = getContent(d, "overview"),
			slug = slug
		}) />

		<cfset annotation.save(false) />

	</cfif>

</cfloop>

<!--- chapters --->
<cfset _Chapter = modelFactory.getModel("Chapter") />
<cfset chapters = $.array.toStruct(_Chapter.list(), "name") />
<cfset chapterXML = xmlSearch(xml, "sections/section[@id='chapters']/pages/page") />
<cfset counter = 0 />

<cfloop from="1" to="#arrayLen(chapterXML)#" index="i">

	<cfset name = chapterXML[i].xmlAttributes.id />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/config/docs/chapters/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfset content = trim(getContent(d, "content")) />

	<cfif content neq "" and not structKeyExists(chapters, name)>

		<cfset counter = counter + 1 />

		<cfset chapter = _Chapter.new({
			name = name,
			description = getContent(d, "description"),
			content = content,
			slug = slug,
			order = counter
		}) />

		<cfset chapter.save(false) />

	</cfif>

</cfloop>

<!--- helpers --->
<cfset _Helper = modelFactory.getModel("Helper") />
<cfset helpers = $.array.toStruct(_Helper.list(), "name") />
<cfset helperArray = directoryList(expandPath("/coldmvc/app/helpers")) />

<cfloop from="1" to="#arrayLen(helperArray)#" index="i">

	<cfset name = getFileName(helperArray[i]) />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/config/docs/helpers/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfif not structKeyExists(helpers, name)>

		<cfset helper = _Helper.new({
			name = name,
			description = getContent(d, "description"),
			example = getContent(d, "example"),
			overview = getContent(d, "overview"),
			slug = slug,
			url = "https://github.com/tonynelson19/ColdMVC/blob/master/app/helpers/" & name & ".cfc"
		}) />

		<cfset helper.save(false) />

	</cfif>

</cfloop>

<!--- plugins --->
<cfset _Plugin = modelFactory.getModel("Plugin") />
<cfset plugins = $.array.toStruct(_Plugin.list(), "name") />
<cfset pluginXML = xmlSearch(xml, "sections/section[@id='plugins']/pages/page") />

<cfloop from="1" to="#arrayLen(pluginXML)#" index="i">

	<cfset name = pluginXML[i].xmlAttributes.id />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/config/docs/plugins/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfif not structKeyExists(plugins, name)>

		<cfset plugin = _Plugin.new({
			name = name,
			description = getContent(d, "description"),
			author = getContent(d, "author", false),
			overview = getContent(d, "overview"),
			example = getContent(d, "example"),
			url = getContent(d, "url", false),
			slug = slug
		}) />

		<cfset plugin.save(false) />

	</cfif>

</cfloop>

<!--- tags --->
<cfset _Tag = modelFactory.getModel("Tag") />
<cfset tags = $.array.toStruct(_Tag.list(), "name") />
<cfset tagArray = directoryList(expandPath("/coldmvc/app/tags")) />

<cfloop from="1" to="#arrayLen(tagArray)#" index="i">

	<cfset name = getFileName(tagArray[i]) />
	<cfset slug = $.string.slugify(name) />

	<cfset d = expandPath("/config/docs/tags/#slug#/")>

	<cfif not directoryExists(d)>
		<cfset directoryCreate(d) />
	</cfif>

	<cfset f = expandPath("/config/docs/tags/#name#.txt") />

	<cfif fileExists(f)>
		<cfset fileDelete(f) />
	</cfif>

	<cfif not structKeyExists(tags, name)>

		<cfset tag = _Tag.new({
			name = name,
			description = getContent(d, "description"),
			example = getContent(d, "example"),
			overview = getContent(d, "overview"),
			parameters = getContent(d, "parameters"),
			slug = slug,
			url = "https://github.com/tonynelson19/ColdMVC/blob/master/app/tags/" & name & ".cfm"
		}) />

		<cfset tag.save(false) />

	</cfif>

</cfloop>

<cfset ormFlush() />