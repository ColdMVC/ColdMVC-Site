/**
 * @accessors true
 */
component {

	property assertionManager;

	/**
	 * @events invalidController
	 */
	function observeNotFound() {

		if ($.event.getKey() != "db.seed") {
			assertionManager.fail(404, "Sorry, but the page you're looking for could not be found.");
		}

	}

}
