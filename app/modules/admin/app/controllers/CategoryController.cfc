/**
 * @accessors true
 */
component {

	property _Category;

	/**
	 * @assertAllowed
	 */
	function index() {

		params.categories = _Category.list();

	}

	/**
	 * @assertAllowed
	 */
	function add() {

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