/**
 * @accessors true
 */
component {

	property _Chapter;

	/**
	 * @layout index
	 */
	function index() {

		params.chapters = _Chapter.list();

	}

	/**
	 * @params slug
	 */
	function show() {

		params.chapter = _Chapter.findBySlug(params.slug);

		assertModelExists(params.chapter, "Invalid chapter");

		var chapters = _Chapter.list();

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