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
	property example;
	property slug;

	function toParam() {
		return variables.slug;
	}

}