<cfset add("/:action", {
	required = {
		controller = "index"
	},
	requirements = {
		action = "download|quickstart|documentation|contact"
	}
}) />

<cfloop list="annotation,helper,plugin,tag" index="i">

	<cfset add("/#i#s/:slug", {
		defaults = {
			controller = i,
			action = "show"
		},
		model = i,
		generates = "/#i#s/:id.slug()"
	}) />

	<cfset add("/#i#s", {
		required = {
			controller = i,
			action = "index"
		}
	}) />

</cfloop>

<cfset add("/guide/:slug", {
	defaults = {
		controller = "chapter",
		action = "show"
	},
	model = "chapter",
	generates = "/guide/:id.slug()"
}) />

<cfset add("/guide", {
	required = {
		controller = "chapter",
		action = "index"
	}
}) />