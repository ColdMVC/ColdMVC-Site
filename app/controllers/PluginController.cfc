/**
 * @accessors true
 */
component {

	property _Plugin;
	property mailSettings;
	property fooService;

	function index() {

		params.plugins = _Plugin.list();

	}

	function show() {

		params.plugin = _Plugin.findBySlug(params.id);

		assertModelExists(params.plugin, "Invalid plugin");

		params.plugins = _Plugin.list();

	}

	function submit() {

		var pluginForm = createForm("plugin");

		if (isPost()) {

			var result = pluginForm.validate(params);

			if (result.isValid()) {

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

			} else {

				params.errors = result.getErrors();

			}

		}

		params.pluginForm = pluginForm;

		params.plugins = _Plugin.list();

	}

}