/**
 * @accessors true
 * @singleton
 */
component {

	/**
	 * @inject coldmvc
	 */
	property coldmvc;

	/**
	 * @inject coldmvc
	 */
	property paginationRenderer;

	property scripts;

	public any function init() {

		variables.scripts = {};

		return this;

	}

	public any function getScript(required string key) {

		if (structKeyExists(variables.scripts, arguments.key)) {

			var script = variables.scripts[arguments.key];

			if (isBoolean(script)) {
				return script;
			}

		}

		return false;

	}

	/**
	 * @events applicationStart
	 */
	public void function bootstrap() {

		coldmvc.form.setOptions({
			button = {
				display = "false",
				class = "btn"
			},
			buttons = {
				class = "actions"
			},
			description = {
				tag = "span",
				class = "help-block"
			},
			errors = {
				class = "alert-message error"
			},
			field = {
				class = "input"
			},
			instructions = {
				tag = "span",
				class = "help-block"
			},
			label = {
				tag = ""
			},
			submit = {
				class = "primary"
			},
			wrapper = {
				class = "clearfix"
			}
		});

		coldmvc.html.setOptions({
			table = {
				class = "zebra-striped"
			},
			flash = {
				class = "alert-message success"
			}
		});

		paginationRenderer.setOptions({
			first = {
				display = "false"
			},
			last = {
				display = "false"
			},
			previous = {
				class = "prev"
			},
			records = {
				display = "false"
			}
		});

	}

}
