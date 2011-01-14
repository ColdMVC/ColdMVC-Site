/**
 * @singleton
 */
component {

	import coldsite.app.model.Email;

	public Email function new() {
		var email = new Email(argumentCollection=arguments);
		writeDump(email);
		writeDump(arguments);
		abort;
		email.setEmailService(this);
		return email;
	}

	public boolean function send(required Email email) {

		writeDump(arguments);
		abort;

	}

}