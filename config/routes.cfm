<cfloop list="annotation,chapter,helper,plugin,tag" index="i">

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