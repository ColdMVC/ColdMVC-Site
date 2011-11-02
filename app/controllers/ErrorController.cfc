/**
 * @accessors true
 */
component {

	/**
	 * @inject coldmvc
	 */
	property framework;

	function unauthorized() {

		if (params.errorContext.getModule() == "admin") {
			returnRedirect({module="admin", controller="authentication", action="login"});
		}

	}

	/**
	 * @events invalidController
	 */
	function observeNotFound() {

		if (getController() != "db") {
			framework.getBean("assertionManager").fail(404, "Sorry, but the page you're looking for could not be found.");
		}

	}

}
