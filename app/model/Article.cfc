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
	property chapter;

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

}