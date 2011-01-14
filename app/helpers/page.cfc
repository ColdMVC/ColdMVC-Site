/**
 * @extends coldmvc.Scope
 * @scope request
 */
component {

	public any function description() {
		return getOrSet("description", arguments);
	}

	public any function header() {
		return getOrSet("header", arguments);
	}

	public any function keywords() {
		return getOrSet("keywords", arguments);
	}

	public any function title() {
		return getOrSet("title", arguments);
	}

}