/**
 * @accessors true
 * @initMethod setup
 * @singleton
 */
component {

	property javaLoader;

	public void function setup() {

		javaLoader.add(getDirectoryFromPath(getCurrentTemplatePath()) & "../../lib/markdownj-1.0.2b4-0.3.0.jar");

		markdownProcessor = javaLoader.create("com.petebevin.markdown.MarkdownProcessor").init();

	}

	public string function markdown(required string string) {

		return markdownProcessor.markdown(string);

	}

}