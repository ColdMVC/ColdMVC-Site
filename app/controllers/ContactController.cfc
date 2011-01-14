/**
 * @accessors true
 * @extends coldmvc.Controller
 */
component {

	property emailService;

	function send() {

		var email = emailService.new(
			from = params.email,
			to = "tonynelson19@gmail.com",
			subject = "ColdMVC Contact Us: #params.name#",
			message = params.message
		);

		writeDump(email.getFrom());
		abort;

	}

}