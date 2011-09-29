/**
 * @accessors true
 */
component {

	property _Helper;

	function index() {

		params.helpers = _Helper.list();

	}

	/**
	 * @params slug
	 */
	function show() {

		params.helper = _Helper.findBySlug(params.slug);

		assertModelExists(params.helper, "Invalid helper");

		params.helpers = _Helper.list();

	}

}