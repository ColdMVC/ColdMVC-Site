/**
 * @accessors true
 */
component {

	property commits;

	public any function init(required string url) {

		commits = [];

		var http = new HTTP();
		http.setMethod("get");
		http.setCharset("utf-8");
		http.setURL(arguments.url);

		var result = http.send().getPrefix();

		if (result.statusCode == "200 OK") {

			var json = result.fileContent.toString();

			if (isJSON(json)) {

				var repository = deserializeJSON(json);
				var i = "";
				var len = arrayLen(repository.commits);
				var max = len > 5 ? 5 : len;

				for (i = 1; i <= max; i++) {

					var commit = {
						id = repository.commits[i].id,
						date = formatDate(repository.commits[i].committed_date),
						message = repository.commits[i].message,
						url = "http://www.github.com" & repository.commits[i].url
					};

					arrayAppend(commits, commit);

				}

			}

		}

		return this;

	}

	private string function formatDate(required string date) {

		arguments.date = parseDateTime(replaceNoCase(left(arguments.date, 16), "T", " ", "all"));
		arguments.date = dateConvert("UTC2Local", arguments.date);
		return dateFormat(arguments.date, "dddd mmmm d, yyyy");

	}

}