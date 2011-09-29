/**
 * @accessors true
 */
component {

	property _Plugin;
	property formFactory;

	function index() {

		params.plugins = _Plugin.list();

	}

	/**
	 * @params slug
	 * @notLoggedIn
	 */
	function show() {

		params.plugin = _Plugin.findBySlug(params.slug);

		assertModelExists(params.plugin, "Invalid plugin");

		params.plugins = _Plugin.list();

	}

	function submit() {

		var pluginForm = formFactory.new("plugin");

		if (isPost() && pluginForm.isValid(params)) {

			// send out an email

			var values = pluginForm.getValues();

			writeDump(values);
			abort;

			flash.message = "Thanks for submitting your plugin.";

			redirect({action="index"});

		}


		params.pluginForm = pluginForm;

	}

}