interface {

	public any function init(required any formFactory);

	public void function create();

	public string function render();

	public struct function getAttributes();

	public any function getAttribute(required string key);

	public any function setAttributes(required struct attributes);

	public any function setAttribute(required string key, required any value);

	public boolean function hasAttribute(required string key);

	public any function removeAttribute(required string key);

	public array function getElements();

	public struct function getElementStruct();

	public any function getElement(required string name);

	public any function addElements(required array elements);

	public any function addElement(required any element);

	public any function createElement(required string type, required string name, struct attributes);

	public boolean function hasElement(required string name);

	public any function removeElement(required string name);

	public struct function getValues();

	public any function populate(required struct data);

	public boolean function isValid(struct data);

	public array function getErrors();

	public any function addError(required string error);

	public boolean function hasErrors();

	public any function clearErrors();

}