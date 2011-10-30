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

	function contact() {

		var feed = new app.model.Feed(config.get("feedURL"));
		var array = $.query.toArray(feed);
		var i = "";
		var len = arrayLen(array);
		var max = len >= 5 ? 5 : len;

		params.messages = [];

		for (i = 1; i <= max; i++) {
			arrayAppend(params.messages, {
				title = array[i].title,
				url = array[i].id
			});
		}

	}

}