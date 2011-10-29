<cfset add("/submit-plugin", "submit-plugin", "plugin.submit") />

<cfset add("/:action", {
	params = {
		controller = "index"
	},
	requirements = {
		action = "download|quickstart|documentation|contact"
	}
}) />