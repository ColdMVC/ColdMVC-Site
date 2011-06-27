/**
 * @accessors true
 * @singleton
 */
component {

	property _Chapter;

	/**
	 * @layout index
	 */
	function index() {

		params.chapters = _Chapter.list({
			sort = "order",
			order = "asc"
		});

	}

	/**
	 * @params slug
	 */
	function show() {

		params.chapter = _Chapter.findBySlug(params.slug);

		assertModelExists(params.chapter, "Invalid chapter");

		var chapters = _Chapter.list({
			sort = "order",
			order = "asc"
		});

		var total = arrayLen(chapters);
		var order = params.chapter.order();

		if (order != 1 && order <= total) {
			params.previous = chapters[order - 1];
		} else {
			params.previous = "";
		}

		if (order < total) {
			params.next = chapters[order + 1];
		} else {
			params.next = "";
		}

	}

}