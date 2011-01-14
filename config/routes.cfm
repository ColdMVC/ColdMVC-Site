<cfset add("/:action", {
	defaults = {
		controller = "site"
	},
	requirements = {
		action = "(home|download|plugins|discussion)"
	}
}) />