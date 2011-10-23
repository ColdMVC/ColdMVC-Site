<cfset add("/submit-plugin", "submit-plugin", "plugin.submit") />

<cfset add("/guide/:id", "chapter.show", {
	aliases = {
		id = "slug"
	}
}) />

<cfset add("/guide", "chapter.index") />

<cfset add("/:action", {
	params = {
		controller = "index"
	},
	requirements = {
		action = "download|quickstart|documentation|contact"
	}
}) />

<cfloop list="annotation,helper,plugin,tag" index="i">

	<cfset add("/#i#s/:id", "#i#.show", {
		aliases = {
			id = "slug"
		}
	}) />

	<cfset add("/#i#s", "#i#.index") />

</cfloop>