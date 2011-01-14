/**
 * @accessors true
 */
component {

	property from;
	property to;
	property cc;
	property bcc;
	property subject;
	property message;
	property emailService;

	public Email function init() {
		variables.from = "";
		variables.to = "";
		variables.cc = "";
		variables.bcc = "";
		variables.subject = "";
		variables.message = "";
		structAppend(variables, arguments, true);
		return this;
	}

	public boolean function send() {
		return mailService.sendEmail(this);
	}

}