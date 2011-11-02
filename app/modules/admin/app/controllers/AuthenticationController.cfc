/**
 * @accessors true
 */
component {

	property _User;

	function login() {

		params.message = "";

		if (isPost()) {

			var user = _User.findByUsername(params.username);

			if (user.exists() && user.passwordMatches(params.password)) {

				$.user.setID(user.getID());

				if (structKeyExists(params, "return")) {
					redirect(params.return);
				} else {
					redirect({controller="index"});
				}

			}

			params.message = "Invalid username or password";

		}

	}

	function logout() {

		$.user.clearID();

		redirect({module="default"});

	}

}