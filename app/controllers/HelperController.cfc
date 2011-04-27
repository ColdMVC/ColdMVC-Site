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

		params.helpers = _Helper.list({sort="name", order="asc"});

	}

	function show() {

		params.helper = _Helper.findBySlug(params.slug);

		if (!params.helper.exists()) {
			setView('helper/invalid');
		}

	}

}