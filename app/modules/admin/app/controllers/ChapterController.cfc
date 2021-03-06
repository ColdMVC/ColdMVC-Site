/**
 * @accessors true
 */
component {

	property _Category;
	property _Chapter;
	property _Status;

	function index() {

		assertAllowed();

		var query = _Chapter.createQuery();
		query.innerJoin("chapter.category");
		query.sort("category.order");
		query.order("asc");

		query.where(
			query.filter("category.id", getParam("category")),
			query.filter("status", getParam("status"))
		);

		params.chapters = query.list();
		params.statuses = _Status.list();
		params.categories = _Category.list();

	}

	function add() {

		assertAllowed();

		var chapter = _Chapter.new();

		if (isPost()) {

			chapter.populate(params.chapter);

			var result = chapter.validate();

			if (result.isValid()) {

				chapter.save();

				flash.message = "Chapter saved successfully";

				redirect({action="index"});

			} else {

				params.errors = result.getErrors();

			}

		}

		params.chapter = chapter;
		params.statuses = _Status.list();
		params.categories = _Category.list();

	}

	/**
	 * @params id
	 */
	function edit() {

		var chapter  = _Chapter.get(params.id);

		assertAllowed(chapter);

		if (isPost()) {

			chapter.populate(params.chapter);

			var result = chapter.validate();

			if (result.isValid()) {

				chapter.save();

				flash.message = "Chapter updated successfully";

				redirect({action="index"});

			} else {

				params.errors = result.getErrors();

			}

		}

		params.chapter = chapter;
		params.statuses = _Status.list();
		params.categories = _Category.list();

	}

	/**
	 * @params id
	 */
	function delete() {

		var chapter  = _Chapter.get(params.id);

		assertAllowed(chapter);

		chapter.delete();

		flash.message = "Chapter deleted successfully";

		redirect({action="index"});

	}

}