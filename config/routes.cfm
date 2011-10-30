<cfset add("/documentation", "documentation.index") />

<cfset add("/submit-plugin", "submit-plugin", "plugin.submit") />

<cfset add("/plugins", "plugin.index") />

<cfset add("/plugin/:id", "plugin", "plugin.show", {
	toParam = {
		id = "getSlug"
	}
}) />

<cfset add("/:action", {
	params = {
		controller = "index"
	},
	requirements = {
		action = "download|quickstart|documentation|discussion|contact"
	}
}) />