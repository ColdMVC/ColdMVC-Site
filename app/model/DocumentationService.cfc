/**
 * @accessors true
 * @singleton
 */
component {

	property _Article;
	property _Category;
	property _Chapter;
	property markdownProcessor;

	/**
	 * @inject coldmvc
	 */
	property $;

	function generateChapterURL() {

		return "/documentation/#arguments.params.id.slug()#";

	}

	function load() {

		var toc = xmlParse(fileRead(expandPath("/config/toc.xml")));
		var i = "";
		var j = "";
		var k = "";

		var query = new Query();
		query.setSQL("
			delete from article;
			delete from chapter;
			delete from category;
		");
		query.execute();

		for (i = 1; i <= arrayLen(toc.categories.xmlChildren); i++) {

			var categoryXML = toc.categories.xmlChildren[i];
			var name = categoryXML.xmlAttributes.name;
			var slug = $.string.slugify(name);

			var category = _Category.new({
				name = name,
				order = i,
				slug = slug
			});

			var text = getText(category.getSlug());
			var html = markdownProcessor.markdown(text);

			category.text(text);
			category.html(html);

			var chapters = [];

			for (j = 1; j <= arrayLen(categoryXML.xmlChildren); j++) {

				var chapterXML = categoryXML.xmlChildren[j];
				var title = chapterXML.xmlAttributes.title;
				var slug = $.string.slugify(title);

				var chapter = _Chapter.new({
					title = chapterXML.xmlAttributes.title,
					order = j,
					slug = slug,
					category = category
				});

				var text = getText(category.getSlug() & "/" & chapter.getSlug());
				var html = markdownProcessor.markdown(text);

				chapter.text(text);
				chapter.html(html);

				var articles = [];

				for (k = 1; k <= arrayLen(chapterXML.xmlChildren); k++) {

					var articleXML = chapterXML.xmlChildren[k];
					var title = articleXML.xmlAttributes.title;
					var slug = $.string.slugify(title);

					var article = _Article.new({
						title = title,
						order = k,
						slug = slug,
						chapter = chapter
					});

					var text = getText(category.getSlug() & "/" & chapter.getSlug() & "/" & article.getSlug());
					var html = markdownProcessor.markdown(text);

					article.text(text);
					article.html(html);
					article.save(false);

					arrayAppend(articles, article);

				}

				chapter.setArticles(articles);

				chapter.save(false);

				arrayAppend(chapters, chapter);

			}

			category.setChapters(chapters);

			category.save(false);

		}

		ormFlush();

	}

	private string function getText(required string path) {

		arguments.path = expandPath("/config/docs/" & arguments.path & ".txt");

		var directory = getDirectoryFromPath(arguments.path);

		if (!directoryExists(directory)) {
			directoryCreate(directory);
		}

		if (!fileExists(arguments.path)) {
			fileWrite(arguments.path, "");
		}

		return fileRead(arguments.path);

	}

}