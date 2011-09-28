interface {

	public any function init();

	public string function render();

	public any function getForm();

	public any function setForm(required any form);

	public string function getName();

	public any function setName(required string name);

	public string function getLabel();

	public any function setLabel(required string label);

	public any function getValue();

	public any function setValue(required any value);

	public struct function getAttributes();

	public any function getAttribute(required string key);

	public any function setAttributes(required struct attributes);

	public any function setAttribute(required string key, required any value);

	public boolean function hasAttribute(required string key);

	public any function removeAttribute(required string key);

	public array function getValidators();

	public struct function getValidatorStruct();

	public any function getValidator(required string type);

	public any function addValidator(required string type, any attributes);

	public boolean function hasValidator(required string type);

	public any function removeValidator(required string type);

	public any function setRequired(required boolean required, any attributes);

	public boolean function isValid();

	public array function getErrors();

	public any function addError(required string error);

	public boolean function hasErrors();

	public any function clearErrors();

}
