/**
 * @accessors true
 */
component {

	property _Article;
	property _Category;
	property _Chapter;
	property _Status;

	function index() {

		assertAllowed();

		var query = _Article.createQuery();
		query.innerJoin("article.chapter");
		query.innerJoin("chapter.category");
		query.sort("article.chapter.category.order");
		query.order("asc");

		if (structKeyExists(params, "category") && params.category != "") {
			query.where(
				query.eq("category.id", params.category)
			);
		}

		if (structKeyExists(params, "chapter") && params.chapter != "") {
			query.where(
				query.eq("chapter.id", params.chapter)
			);
		}

		if (structKeyExists(params, "status") && params.status != "") {
			query.where(
				query.eq("status", params.status)
			);
		}

		params.articles = query.list();
		params.statuses = _Status.list();
		params.chapters = _Chapter.getOptions();
		params.categories = _Category.list();

	}

	function add() {

		assertAllowed();

		var article = _Article.new();

		if (isPost()) {

			article.populate(params.article);

			var result = article.validate();

			if (result.isValid()) {

				article.save();

				flash.message = "Article saved successfully";

				redirect({action="index"});

			} else {

				params.errors = result.getErrors();

			}

		}

		params.article = article;
		params.statuses = _Status.list();
		params.chapters = _Chapter.getOptions();

	}

	/**
	 * @params id
	 */
	function edit() {

		var article  = _Article.get(params.id);

		assertAllowed(article);

		if (isPost()) {

			article.populate(params.article);

			var result = article.validate();

			if (result.isValid()) {

				article.save();

				flash.message = "Article updated successfully";

				redirect({action="index"});

			} else {

				params.errors = result.getErrors();

			}

		}

		params.article = article;
		params.statuses = _Status.list();
		params.chapters = _Chapter.getOptions();

	}

	/**
	 * @params id
	 */
	function delete() {

		var article  = _Article.get(params.id);

		assertAllowed(article);

		article.delete();

		flash.message = "Article deleted successfully";

		redirect({action="index"});

	}

}