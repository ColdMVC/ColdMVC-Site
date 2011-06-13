/**
 * @accessors true
 * @singleton
 */
component {

	property _Plugin;

	/**
	 * @layout index
	 */
	function index() {

		params.plugins = _Plugin.list({
			sort = "name",
			order = "asc"
		});

	}

	/**
	 * @params slug
	 */
	function show() {

		params.plugin = _Plugin.findBySlug(params.slug);

		assertModelExists(params.plugin, "Invalid plugin");

	}

}