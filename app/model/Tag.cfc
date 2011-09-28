/**
 * @extends coldmvc.Model
 * @persistent true
 * @sort name
 * @order asc
 */
component {

	property id;
	property name;
	property description;
	property overview;
	property parameters;
	property example;
	property slug;
	property url;

	function toParam() {
		return variables.slug;
	}

}