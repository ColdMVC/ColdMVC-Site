/**
 * @extends coldmvc.Model
 * @persistent true
 * @sort order
 * @order asc
 */
component {

	property id;

	/**
	 * @required
	 */
	property name;

	/**
	 * @required
	 * @integer
	 */
	property order;

	/**
	 * @required
	 */
	property slug;

	property text;
	property html;
	property chapters;

}