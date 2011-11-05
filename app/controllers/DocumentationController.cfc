/**
 * @accessors true
 */
component {

	property _Category;
	property _Chapter;
	property _Status;

	function index() {

		params.categories = _Category.listActive();

	}

	function category() {

		params.categories = _Category.listActive();

		params.category = _Category.findBySlug(params.category);

	}

	function chapter() {

		var query = _Chapter.createQuery();
		query.innerJoin("chapter.category", "category");
		query.where(
			query.eq("category.slug", params.category),
			query.eq("chapter.slug", params.chapter)
		);

		params.chapter = query.get();

		params.categories = _Category.listActive();

	}

}