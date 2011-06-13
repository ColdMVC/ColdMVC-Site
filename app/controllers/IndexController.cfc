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

	function quickstart() {

	}

}