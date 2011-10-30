<cfset add("/submit-plugin", "submit-plugin", "plugin.submit") />

<cfset add("/:action", {
	params = {
		controller = "index"
	},
	requirements = {
		action = "download|quickstart|documentation|discussion|contact"
	}
}) />

<cfset add("/plugins", "plugin.index") />

<cfset add("/plugin/:id", "plugin", "plugin.show", {
	toParam = {
		id = "getSlug"
	}
}) />