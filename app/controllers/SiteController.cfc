/**
 * @singleton
 * @directory /
 */
component {

	/**
	 * @events invalidController
	 */
	function interceptPageNotFound() {

		$.event.controller("site");
		$.event.action("pageNotFound");

	}

	function pageNotFound() {

		$.event.view("404");

	}

}