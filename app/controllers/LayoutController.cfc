/**
 * @accessors true
 * @singleton
 */
component {

	property _Annotation;
	property _Chapter;
	property _Tag;

	function pre() {

		params.sidebars = [];

	}

	function annotation() {

		addSidebar("annotation/sidebar");
		params.annotations = _Annotation.list();

	}

	function chapter() {

		addSidebar("chapter/sidebar");
		params.chapters = _Chapter.list();

	}

	function discussion() {

		addSidebar("discussion/sidebar");

		var feed = new app.model.Feed("http://groups.google.com/group/coldmvc/feed/rss_v2_0_topics.xml");
		var array = $.query.toArray(feed);
		var i = "";
		var len = arrayLen(array);
		var max = len >= 3 ? 3 : len;

		params.messages = [];

		for (i = 1; i <= max; i++) {

			arrayAppend(params.messages, {
				title = array[i].title,
				url = array[i].id
			});

		}

	}

	function tag() {

		addSidebar("tag/sidebar");
		params.tags = _Tag.list();

	}

	private function addSidebar(required string sidebar) {

		arrayAppend(params.sidebars, arguments.sidebar);
		$.event.layout("sidebar");

	}

}