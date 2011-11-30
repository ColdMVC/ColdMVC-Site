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

		query.where(
			query.filter("category.id", getParam("category")),
			query.filter("chapter.id", getParam("chapter")),
			query.filter("status", getParam("status"))
		);

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