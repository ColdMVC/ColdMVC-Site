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
				var name = chapterXML.xmlAttributes.name;
				var slug = $.string.slugify(name);

				var chapter = _Chapter.new({
					name = chapterXML.xmlAttributes.name,
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
					var name = articleXML.xmlAttributes.name;
					var slug = $.string.slugify(name);

					var article = _Article.new({
						name = name,
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

		var query = new Query();
		query.setSQL("
			update category
			set status = 'Active';

			update chapter
			set status = 'Active'
			where id in (
				select id
				from chapter
				where html is not null
				or id in (
					select distinct chapter_id
					from article
					where html is not null
				)
			);

			update chapter
			set status = 'Incomplete'
			where id not in (
				select id
				from chapter
				where html is not null
				or id in (
					select distinct chapter_id
					from article
					where html is not null
				)
			);

			update article
			set status = 'Active'
			where html is not null;

			update article
			set status = 'Incomplete'
			where html is null;
		");
		query.execute();

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