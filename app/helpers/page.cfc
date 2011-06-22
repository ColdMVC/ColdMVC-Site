/**
 * @extends coldmvc.Scope
 */
component {

	public struct function getScope() {

		return request;

	}

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

		if (!structIsEmpty(arguments)) {

			var title = get("title");

			if (title == "") {
				title = arguments[1];
			}
			else {
				title = title & ": " & arguments[1];
			}

			set("title", title);

		}

		return get("title");

	}

}