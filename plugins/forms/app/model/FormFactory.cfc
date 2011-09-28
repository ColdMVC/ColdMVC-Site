/**
 * @accessors true
 * @initMethod setup
 * @singleton
 */
component {

	property beanFactory;
	property componentLocator;
	property tagInvoker;

	public any function init() {

		return this;

	}

	public void function setup() {

		variables.forms = componentLocator.locate("/app/model/forms");
		variables.elements = componentLocator.locate("/app/model/form/elements");
		variables.validators = componentLocator.locate("/app/model/form/validators");
		variables.validatorInstances = {};
		variables.validatorMessages = {};

	}

	public any function new(required string key, struct properties) {

		if (!structKeyExists(arguments, "properties")) {
			arguments.properties = {};
		}

		var constructorArgs = {
			formFactory = this
		};

		var instance = beanFactory.new(variables.forms[arguments.key], constructorArgs, arguments.properties);

		instance.create();

		return instance;

	}

	public boolean function hasForm(required string type) {

		return structKeyExists(variables.forms, arguments.type);

	}

	public string function getForm(required string type) {

		return variables.forms[arguments.type];

	}

	public any function createElement(required string type, struct attributes) {

		if (!structKeyExists(arguments, "attributes")) {
			arguments.attributes = {};
		}

		if (hasElement(arguments.type)) {

			var classPath = getElement(arguments.type);

			return beanFactory.new(classPath, {}, { attributes = arguments.attributes });

		}

	}


	public boolean function hasElement(required string type) {

		return structKeyExists(variables.elements, arguments.type);

	}

	public string function getElement(required string type) {

		return variables.elements[arguments.type];

	}

	public boolean function hasValidator(required string type) {

		return structKeyExists(variables.validators, arguments.type);

	}

	public any function getValidator(required string type) {

		if (!structKeyExists(variables.validatorInstances, arguments.type)) {
			variables.validatorInstances[arguments.type] = beanFactory.new(variables.validators[arguments.type]);
		}

		return variables.validatorInstances[arguments.type];

	}

	public any function getValidatorMessage(required string type) {

		if (!structKeyExists(variables.validatorMessages, arguments.type)) {
			variables.validatorMessages[arguments.type] = getAnnotation(variables.validators[arguments.type], "message", "Please enter a valid " & lcase(coldmvc.string.propercase(arguments.type)) & " for ${property}.");
		}

		return variables.validatorMessages[arguments.type];

	}

	private string function getAnnotation(required string classPath, required string key, required string value) {

		var metaData = getComponentMetadata(arguments.classPath);

		while (structKeyExists(metaData, "extends")) {

			if (structKeyExists(metaData, arguments.key)) {
				return metaData[arguments.key];
			}

			metaData = metaData.extends;

		}

		return arguments.value;

	}

}