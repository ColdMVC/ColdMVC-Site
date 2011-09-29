/**
 * @accessors true
 */
component {

	property _Plugin;
	property formFactory;
	property mailSettings;

	function index() {

		params.plugins = _Plugin.list();

	}

	/**
	 * @params slug
	 */
	function show() {

		params.plugin = _Plugin.findBySlug(params.slug);

		assertModelExists(params.plugin, "Invalid plugin");

		params.plugins = _Plugin.list();

	}

	function submit() {

		var pluginForm = formFactory.new("plugin");

		if (isPost() && pluginForm.isValid(params)) {

			var attributes = {
				to = "coldmvc@gmail.com",
				from = "coldmvc@gmail.com",
				subject = "New Plugin Submission: #escape(pluginForm.pluginName.getValue())#",
				body = renderPartial("plugin/email.cfm", pluginForm.getValues()),
				type = "html",
				server = mailSettings.server,
				username = mailSettings.username,
				password = mailSettings.password
			};

			var email = new Mail(argumentCollection=attributes);

			email.send();

			flash.message = "Thanks for submitting your plugin. I'll email you if I have any questions.";

			redirect({action="index"});

		}


		params.pluginForm = pluginForm;

	}

}