/**
 * @accessors true
 */
component {

	/**
	 * @inject coldmvc
	 */
	property config;

	function index() {

	}

	function download() {

		var repository = new app.model.Repository(config.get("repositoryURL"));
		params.commits = repository.getCommits();

	}

	function quickstart() {

	}

}