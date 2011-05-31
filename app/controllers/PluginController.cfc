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
			sort = "order",
			order = "asc"
		});

	}

	function show() {

		params.plugin = _Plugin.findBySlug(params.slug);

		if (!params.plugin.exists()) {
			setView('plugin/invalid');
		}

	}

}