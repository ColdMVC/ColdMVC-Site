/**
 * @singleton true
 * @beanName _Status
 */
component {

	this.ACTIVE = 'Active';
	this.DENIED = 'Denied';
	this.INCOMPLETE = 'Incomplete';
	this.SUBMITTED = 'Submitted';

	public any function init() {

		variables.statuses = [
			this.INCOMPLETE,
			this.SUBMITTED,
			this.ACTIVE,
			this.DENIED
		];

		return this;

	}

	public array function list() {

		return variables.statuses;

	}

}