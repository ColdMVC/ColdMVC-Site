/**
 * @accessors true
 * @initMethod setup
 * @singleton
 */
component {

	property config;
	property javaLoader;

	public void function setup() {

		javaLoader.add(getDirectoryFromPath(getCurrentTemplatePath()) & "../../lib/markdownj-1.0.2b4-0.3.0.jar");

		markdownProcessor = javaLoader.create("com.petebevin.markdown.MarkdownProcessor").init();

		urlPath = config.get("urlPath");

	}

	public string function markdown(required string string) {

		string = replace(string, "]: /", "]: #urlPath#/", "all");

		string = replaceTables(string);

		return markdownProcessor.markdown(string);

	}

	private string function replaceTables(required string string) {

		if (find("|", string)) {

			var array = listToArray(string, chr(10));
			var i = "";
			var j = "";
			var insideTable = false;
			var line = "";
			var table = [];
			var cells = [];
			var cell = "";
			var insideBody = false;
			var rows = 0;
			var headers = 0;
			var start = 0;
			var end = 0;
			var tables = [];
			var new = [];

			for (i = 1; i <= arrayLen(array); i++) {

				line = array[i];

				if (left(line, 1) == "|") {

					if (!insideTable) {

						start = i;
						table = [];
						arrayAppend(table, "<table>");
						arrayAppend(table, "<thead>");
						arrayAppend(table, "<tr>");


						cells = listToArray(line, "|");
						for (j = 1; j <= arrayLen(cells); j++) {

							var cell = trim(cells[j]);

							if (cell != "") {
								headers = headers + 1;
								arrayAppend(table, "<th>#cell#</th>");
							}

						}

						arrayAppend(table, "</tr>");
						arrayAppend(table, "</thead>");

					}
					else {

						if (rows != 0) {

							if (!insideBody) {
								arrayAppend(table, "<tbody>");
								insideBody = true;
							}

							arrayAppend(table, "<tr>");

							cells = listToArray(line, "|");

							for (j = 1; j <= headers; j++) {
								arrayAppend(table, "<td>#trim(cells[j])#</td>");
							}

							arrayAppend(table, "</tr>");

						}

						rows = rows + 1;

					}

					insideTable = true;

				}
				else {

					if (insideTable) {

						arrayAppend(table, "</tbody>");
						arrayAppend(table, "</table>");

						arrayAppend(tables, {
							start = start,
							end = i - 1,
							array = table
						});

					}

					insideTable = false;
					insideBody = false;
					insideBody = 0;
					headers = 0;

				}

			}

			// in case the loop ending inside a table
			if (insideTable) {

				arrayAppend(table, "</tbody>");
				arrayAppend(table, "</table>");

				arrayAppend(tables, {
					start = start,
					end = i - 1,
					array = table
				});

			}

			new = [];
			start = 1;
			end = 0;

			for (i = 1; i <= arrayLen(tables); i++) {

				table = tables[i];

				if (table.start > start) {

					for (j = 1; j <= table.start-1; j++) {
						arrayAppend(new, array[j]);
					}

				}

				for (j = 1; j <= arrayLen(table.array); j++) {
					arrayAppend(new, table.array[j]);
				}

				start = table.end;
				end = table.end + 1;

			}

			if (end == 0) {

				new = array;

			}
			else if (end < arrayLen(array)) {

				for (i = end; i <= arrayLen(array); i++) {
					arrayAppend(new, array[i]);
				}

			}

			string = arrayToList(new, chr(10));

		}

		return string;

	}

}