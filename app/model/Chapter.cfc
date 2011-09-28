/**
 * @extends coldmvc.Model
 * @persistent true
 * @sort order
 * @order asc
 */
component {

	property id;
	property name;
	property description;
	property content;
	property slug;
	property order;

	function toParam() {
		return variables.slug;
	}

}