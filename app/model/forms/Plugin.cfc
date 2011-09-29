/**
 * @accessors true
 * @extends plugins.forms.app.model.Form
 */
component {

	public void function create() {

		addElement("input", "yourName")
			.setDescription("So I can give you credit for your work.")
			.setRequired(true, "Please enter your name.");

		addElement("email", "yourEmail")
			.setDescription("So I know how to contact you. Don't worry, it won't be shared or displayed anywhere.")
			.setRequired(true, "Please enter your email address.")
			.addValidator("email", "Please enter valid email address.");

		addElement("input", "pluginName")
			.setDescription("So I know what to call your code.")
			.setRequired(true, "Please enter the name of the plugin. It does have a name, right?");

		addElement("url", "pluginURL")
			.setLabel("Plugin URL")
			.setDescription("So I know where to see your code. A GitHub repository URL works best.")
			.setRequired(true, "Please enter the URL of the plugin.")
			.addValidator("url", "Please enter a valid URL.");

		addElement("textarea", "description")
			.setDescription("So I know what your code does. You can be brief. I'll email you if I have any questions.")
			.setRequired(true, "Please enter a description.");

		addElement("submit", "submit")
			.setLabel("Submit Plugin");

	}

}