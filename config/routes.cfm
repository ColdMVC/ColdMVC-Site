<cfloop list="annotation,chapter,tag" index="i">

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

<cfset add("/:action", {
	defaults = {
		controller = "site"
	},
	requirements = {
		action = "(home|download|plugins)"
	}
}) />