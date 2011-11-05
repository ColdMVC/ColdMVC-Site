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
	property slug;
	property text;
	property html;

	/**
	 * @array
	 */
	property chapters;

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

	public array function listActive() {

		return this.findAllWhere({
			status = _Status.ACTIVE
		});

	}

	public array function getActiveChapters() {

		var result = [];
		var chapters = getChapters();
		var i = "";

		for (i = 1; i <= arrayLen(chapters); i++) {

			var chapter = chapters[i];

			if (chapter.status() == _Status.ACTIVE) {
				arrayAppend(result, chapter);
			}

		}

		return result;

	}

}