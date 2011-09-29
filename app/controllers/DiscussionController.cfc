/**
 * @accessors true
 */
component {

	function index() {

		var feed = new app.model.Feed("http://groups.google.com/group/coldmvc/feed/rss_v2_0_topics.xml");
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