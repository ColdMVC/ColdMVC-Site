<cfset add("/submit-plugin", {
	params = {
		controller = "plugin",
		action = "submit"
	}
}) />

<cfset add("/guide/:slug", {
	params = {
		controller = "chapter",
		action = "show"
	},
	model = "chapter",
	generates = "/guide/:id"
}) />

<cfset add("/guide", {
	params = {
		controller = "chapter",
		action = "index"
	}
}) />

<cfset add("/:action", {
	params = {
		controller = "index"
	},
	requirements = {
		action = "download|quickstart|documentation|contact"
	}
}) />

<cfloop list="annotation,helper,plugin,tag" index="i">

	<cfset add("/#i#s/:slug", {
		params = {
			controller = i,
			action = "show"
		},
		model = i,
		generates = "/#i#s/:id"
	}) />

	<cfset add("/#i#s", {
		params = {
			controller = i,
			action = "index"
		}
	}) />

</cfloop>