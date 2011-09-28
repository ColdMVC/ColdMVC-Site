/**
 * @extends plugins.forms.app.model.form.Validator
 * @implements plugins.forms.app.model.form.IValidator
 * @message The value for ${property} must be a valid URL.
 */
component {

	public boolean function isValid(required any element, required struct options) {

		if (isSimpleValue(arguments.element.getValue()) && arguments.element.getValue() == "") {
			return true;
		}

		return coldmvc.valid.url(arguments.element.getValue());

	}

}