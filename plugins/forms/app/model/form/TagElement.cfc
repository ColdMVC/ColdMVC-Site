/**
 * @accessors true
 * @extends plugins.forms.app.model.form.Element
 */
component {

	property tagInvoker;

	public any function init() {

		var metaData = getMetaData(this);
		variables.tag = lcase(listLast(metaData.fullName, "."));

		super.init();

		return this;

	}

	public string function render() {

		return tagInvoker.invoke(variables.tag, variables.attributes);

	}

}