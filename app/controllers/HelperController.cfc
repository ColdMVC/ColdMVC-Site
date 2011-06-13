/**
 * @accessors true
 * @singleton
 */
component {

	property _Helper;

	/**
	 * @layout index
	 */
	function index() {

		params.helpers = _Helper.list({
			sort = "name",
			order = "asc"
		});

	}

	/**
	 * @params slug
	 */
	function show() {

		params.helper = _Helper.findBySlug(params.slug);

		assertModelExists(params.helper, "Invalid helper");

	}

}