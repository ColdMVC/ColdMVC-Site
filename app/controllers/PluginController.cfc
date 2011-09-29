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

			var body = renderPartial("plugin/email.cfm", pluginForm.getValues());

			var email = new Mail();
			email.setTo("coldmvc@gmail.com");
			email.setFrom("coldmvc@gmail.com");
			email.setSubject("New Plugin Submission: #escape(pluginForm.pluginName.getValue())#");
			email.setBody(body);
			email.setType("html");
			email.send();

			flash.message = "Thanks for submitting your plugin. I'll email you if I have any questions.";

			redirect({action="index"});

		}


		params.pluginForm = pluginForm;

	}

}