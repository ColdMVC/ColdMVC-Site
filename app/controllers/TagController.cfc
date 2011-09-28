/**
 * @accessors true
 */
component {

	property _Tag;

	/**
	 * @layout index
	 */
	function index() {

		params.tags = _Tag.list();

	}

	/**
	 * @params slug
	 */
	function show() {

		params.tag = _Tag.findBySlug(params.slug);

		assertModelExists(params.tag, "Invalid tag");

	}

}