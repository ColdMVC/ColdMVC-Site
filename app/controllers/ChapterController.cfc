/**
 * @accessors true
 */
component {

	property _Chapter;

	function index() {

		params.chapters = _Chapter.list();

	}

	/**
	 * @params slug
	 */
	function show() {

		params.chapter = _Chapter.findBySlug(params.slug);

		assertModelExists(params.chapter, "Invalid chapter");

		params.chapters = _Chapter.list();

		var total = arrayLen(params.chapters);
		var order = params.chapter.order();

		if (order != 1 && order <= total) {
			params.previous = params.chapters[order - 1];
		} else {
			params.previous = "";
		}

		if (order < total) {
			params.next = params.chapters[order + 1];
		} else {
			params.next = "";
		}

		getRequestContext().addAction("sidebar");

	}

	function sidebar() {

		params.chapters = _Chapter.list();

	}

}