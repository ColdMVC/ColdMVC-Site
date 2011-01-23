/**
 * @accessors true
 * @singleton
 */
component {

	property _Tag;

	/**
	 * @layout index
	 */
	function index() {

		params.tags = _Tag.list({sort="name", order="asc"});

	}

	function show() {

		params.tag = _Tag.findBySlug(params.slug);

		if (!params.tag.exists()) {
			$.event.view('tag/invalid');
		}

	}

}