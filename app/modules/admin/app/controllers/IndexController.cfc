/**
 * @accessors true
 * @resource dashboard
 */
component {

	property documentationService;

	function index() {

		assertAllowed();

	}

	function load() {

		assertAllowed();

		documentationService.load();

		flash.message = "Documentation loaded";

		redirect({action="index"});

	}

}