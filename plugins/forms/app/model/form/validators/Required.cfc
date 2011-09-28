/**
 * @extends plugins.forms.app.model.form.Validator
 * @implements plugins.forms.app.model.form.IValidator
 * @message The value for ${property} is required.
 */
component {

	public boolean function isValid(required any element, required struct options) {

		return arguments.element.getValue() != "";

	}

}