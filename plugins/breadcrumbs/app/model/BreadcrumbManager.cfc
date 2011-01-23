/**
 * @accessors true
 * @singleton
 */
component {

	property eventMapper;
	property tabManager;

	public array function getBreadcrumbs(required string controller, required string action) {

		var breadcrumbs = [];
		var mapping = eventMapper.getMapping(arguments.controller, arguments.action);
		var key = mapping.event;
		var config = tabManager.getConfig();

		while (structKeyExists(config.events, key)) {

			var tab = config.events[key];

			arrayPrepend(breadcrumbs, {
				text = tab.title,
				url = tab.url
			});

			key = tab.parent;

		}

		return breadcrumbs;

	}

}