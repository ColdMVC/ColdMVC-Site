/**
 * @extends coldmvc.Model
 * @persistent true
 * @sort order
 * @order asc
 */
component {

	property id;

	/**
	 * @required
	 */
	property name;

	/**
	 * @required
	 */
	property status;

	/**
	 * @required
	 * @integer
	 */
	property order;

	property text;
	property html;
	property slug;

	/**
	 * @required
	 */
	property category;

	/**
	 * @array
	 */
	property articles;

	property _Status;
	property markdownProcessor;

	function preInsert() {

		preProcess();

	}

	function preUpdate() {

		preProcess();

	}

	private any function preProcess() {

		this.slug($.string.slugify(this.name()));
		this.html(markdownProcessor.markdown(this.text()));

	}

	public boolean function hasText() {

		return this.text() != '';

	}

	public array function getOptions() {

		var query = this.createQuery();
		query.innerJoin("chapter.category");
		query.sort("category.order");
		query.order("asc");

		var chapters = query.list();
		var i = "";
		var options = [];

		for (i = 1; i <= arrayLen(chapters); i++) {

			var chapter = chapters[i];
			var option = {};
			option.id = chapter.id();
			option.name = chapter.category().name() & ": " & chapter.name();

			arrayAppend(options, option);

		}

		return options;

	}

	public array function getActiveArticles() {

		var result = [];
		var articles = getArticles();
		var i = "";

		for (i = 1; i <= arrayLen(articles); i++) {

			var article = articles[i];

			if (article.status() == _Status.ACTIVE) {
				arrayAppend(result, article);
			}

		}

		return result;

	}

}