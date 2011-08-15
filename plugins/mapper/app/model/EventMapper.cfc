/**
 * @accessors true
 * @initMethod setup
 * @singleton
 */
component {

	property fileSystem;
	property pluginManager;

	public EventMapper function init() {

		variables.mappings = {};
		variables.config = [];
		return this;

	}

	public void function setup() {

		var plugins = pluginManager.getPlugins();
		var path = "/config/mappings.xml";
		var i = "";
		var defaultFilePath = "/plugins/mapper" & path;

		loadXML(path);

		for (i = 1; i <= arrayLen(plugins); i++) {

			var filePath = plugins[i].mapping & path;

			if (filePath != defaultFilePath) {
				loadXML(filePath);
			}

		}

		loadXML(defaultFilePath);

	}

	private void function loadXML(required string filePath) {

		if (!fileSystem.fileExists(arguments.filePath)) {
			arguments.filePath = expandPath(arguments.filePath);
		}

		if (fileSystem.fileExists(arguments.filePath)) {

			var xml = xmlParse(fileRead(arguments.filePath));
			var i = "";

			for (i = 1; i <= arrayLen(xml.mappings.xmlChildren); i++) {

				var mappingXML = xml.mappings.xmlChildren[i];
				var mapping = {};
				mapping.controller = mappingXML.xmlAttributes.controller;
				mapping.action = mappingXML.xmlAttributes.action;
				mapping.event = coldmvc.xml.get(mappingXML, "event", "index");
				mapping.requires = coldmvc.xml.get(mappingXML, "requires", "none");

				arrayAppend(config, mapping);

			}

		}

	}

	public struct function getMapping(required string controller, required string action) {

		var event = arguments.controller & "." & arguments.action;

		if (!structKeyExists(variables.mappings, event)) {

			var i = "";
			for (i = 1; i <= arrayLen(variables.config); i++) {

				var mapping = variables.config[i];

				// run regular expressions to match the controller and action
				if (reFindNoCase("^#mapping.controller#$", arguments.controller) && reFindNoCase("^#mapping.action#$", arguments.action)) {

					var result = {};
					result.requires = mapping.requires;

					// if there's a period, it's {controller}.{action}
					if (find(".", mapping.event)) {
						result.controller = listFirst(mapping.event, ".");
						result.action = listLast(mapping.event, ".");
					}
					else {
						// {action}
						result.controller = arguments.controller;
						result.action = mapping.event;
					}

					// check for placeholders
					if (result.controller == ":controller") {
						result.controller = arguments.controller;
					}

					if (result.action == ":action") {
						result.action = arguments.action;
					}

					result.event = result.controller & "." & result.action;

					variables.mappings[event] = result;
					break;

				}

			}

		}

		if (structKeyExists(variables.mappings, event)) {
			return variables.mappings[event];
		} else {
			return variables.mappings["index.index"];
		}

	}

}