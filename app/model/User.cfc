/**
 * @extends coldmvc.Model
 * @persistent true
 * @sort firstName asc, lastName
 * @order asc
 */
component {

	property id;

	/**
	 * @required
	 */
	property firstName;

	/**
	 * @required
	 */
	property lastName;

	/**
	 * @required
	 * @email
	 */
	property username;

	/**
	 * @required
	 */
	property password;

	/**
	 * @required
	 */
	property salt;

	/**
	 * @required
	 */
	property role;

	public any function init() {

		variables.role = "guest";

		return this;

	}

	public boolean function passwordMatches(required string password) {

		var generatedPassword =	$.string.hash(arguments.password, getSalt());

		return generatedPassword == getPassword();

	}

}