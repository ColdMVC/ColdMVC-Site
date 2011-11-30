/**
 * @accessors true
 */
component {

	property _Category;
	property _Status;

	function index() {

		assertAllowed();

		var query = _Category.createQuery();
		query.where(
			query.filter("status", getParam("status"))
		);

		params.categories = query.list();
		params.statuses = _Status.list();

	}

	function add() {

		assertAllowed();

		var category = _Category.new();

		if (isPost()) {

			category.populate(params.category);

			var result = category.validate();

			if (result.isValid()) {

				category.save();

				flash.message = "Category saved successfully";

				redirect({action="index"});

			} else {

				params.errors = result.getErrors();

			}

		}

		params.category = category;
		params.statuses = _Status.list();

	}

	/**
	 * @params id
	 */
	function edit() {

		var category  = _Category.get(params.id);

		assertAllowed(category);

		if (isPost()) {

			category.populate(params.category);

			var result = category.validate();

			if (result.isValid()) {

				category.save();

				flash.message = "Category updated successfully";

				redirect({action="index"});

			} else {

				params.errors = result.getErrors();

			}

		}

		params.category = category;
		params.statuses = _Status.list();

	}

	/**
	 * @params id
	 */
	function delete() {

		var category  = _Category.get(params.id);

		assertAllowed(category);

		category.delete();

		flash.message = "Category deleted successfully";

		redirect({action="index"});

	}

}