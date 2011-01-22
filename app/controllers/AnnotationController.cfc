/**
 * @accessors true
 * @singleton
 */
component {

	property _Annotation;

	/**
	 * @layout index
	 */
	function index() {

		params.annotations = _Annotation.list();

	}

	function show() {

		params.annotation = _Annotation.findBySlug(params.slug);

		if (!params.annotation.exists()) {
			$.event.view('annotation/invalid');
		}

	}

}