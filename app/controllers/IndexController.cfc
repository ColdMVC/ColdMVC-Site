/**
 * @accessors true
 * @singleton
 */
component {

	property config;

	function download() {

		var repository = new app.model.Repository(config.get("repositoryURL"));
		params.commits = repository.getCommits();

	}

	/**
	 * @events invalidController
	 */
	function interceptPageNotFound() {

		if ($.event.key() != "db.seed") {
			setController("site");
			setAction("pageNotFound");
		}

	}

	function pageNotFound() {

		setView("404");

	}

	function quickstart() {

	}

}