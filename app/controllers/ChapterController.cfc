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

		params.chapters = _Chapter.list();

	}

	function show() {


		params.chapter = _Chapter.findBySlug(params.slug);

		if (params.chapter.exists()) {

			var chapters = _Chapter.list();
			var total = arrayLen(chapters);
			var order = params.chapter.order();

			params.next = "";
			params.previous = "";

			if (order != 1 && order < total) {
				params.previous = chapters[order - 1];
			}

			if (order < total) {
				params.next = chapters[order + 1];
			}

		}
		else {

			$.event.view('chapter/invalid');

		}

	}

}