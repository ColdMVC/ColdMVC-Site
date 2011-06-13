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

		params.annotations = _Annotation.list({
			sort = "name",
			order = "asc"
		});

	}

	/**
	 * @params slug
	 */
	function show() {

		params.annotation = _Annotation.findBySlug(params.slug);

		assertModelExists(params.annotation, "Invalid annotation");

	}

}