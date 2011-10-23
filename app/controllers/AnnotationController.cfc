/**
 * @accessors true
 */
component {

	property _Annotation;

	function index() {

		params.annotations = _Annotation.list();

	}

	/**
	 * @params slug
	 */
	function show() {

		params.annotation = _Annotation.findBySlug(params.slug);

		assertModelExists(params.annotation, "Invalid annotation");

		getRequestContext().addAction("sidebar");

	}

	function sidebar() {

		params.annotations = _Annotation.list();

	}

}