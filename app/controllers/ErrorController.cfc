/**
 * @accessors true
 */
component {

	property framework;

	/**
	 * @events invalidController
	 */
	function observeNotFound() {

		if (getController() != "db") {
			framework.getBean("assertionManager").fail(404, "Sorry, but the page you're looking for could not be found.");
		}

	}

}
