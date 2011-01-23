/**
 * @accessors true
 * @singleton
 */
component {

	property _Annotation;
	property _Chapter;
	property _Helper;
	property _Plugin;
	property _Tag;

	function pre() {

		params.sidebars = [];

	}

	function annotation() {

		addSidebar("annotation/sidebar");
		params.annotations = _Annotation.list({sort="name", order="asc"});

	}

	function chapter() {

		addSidebar("chapter/sidebar");
		params.chapters = _Chapter.list({sort="order", order="asc"});

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

	function helper() {

		addSidebar("helper/sidebar");
		params.helpers = _Helper.list({sort="name", order="asc"});

	}

	function plugin() {

		addSidebar("plugin/sidebar");
		params.plugins = _Plugin.list({sort="name", order="asc"});

	}

	function tag() {

		addSidebar("tag/sidebar");
		params.tags = _Tag.list({sort="name", order="asc"});

	}

	private function addSidebar(required string sidebar) {

		arrayAppend(params.sidebars, arguments.sidebar);
		$.event.layout("sidebar");

	}

}