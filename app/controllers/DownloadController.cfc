/**
 * @accessors true
 * @singleton
 */
component {

	property config;

	function index() {

		var repository = new coldsite.app.model.Repository(config.get("repositoryURL"));
		params.commits = repository.getCommits();

	}

}