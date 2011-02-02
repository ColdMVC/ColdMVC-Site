/**
 * @singleton
 * @directory /
 */
component {

	/**
	 * @events invalidController
	 */
	function interceptPageNotFound() {

		if ($.event.key() != "db.seed") {

			$.event.controller("site");
			$.event.action("pageNotFound");

		}

	}

	function pageNotFound() {

		$.event.view("404");

	}

}