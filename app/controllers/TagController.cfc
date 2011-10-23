/**
 * @accessors true
 */
component {

	property _Tag;

	function index() {

		params.tags = _Tag.list();

	}

	/**
	 * @params slug
	 */
	function show() {

		params.tag = _Tag.findBySlug(params.slug);

		assertModelExists(params.tag, "Invalid tag");

		getRequestContext().addAction("sidebar");

	}

	function sidebar() {

		params.tags = _Tag.list();

	}

}