<cfset $.page.setContent("header", "Quick Start") />
<cfset open = "<" />

<c:markdown>
# So you want to build an application using ColdMVC?

You've come to the right place. In this one-page tutorial, we'll create a very simple application for managing books and performing basic [CRUD] [1] operations using ColdMVC.

While I'll try to explain some things along the way, once you've completed this tutorial,
you should head over to the [Documentation] [2] chapter for a more thorough explanation on how certain things are done.

[1]: http://en.wikipedia.org/wiki/Create,_read,_update_and_delete "Create, read, update and delete"
[2]: /documentation "Documentation"
</c:markdown>

<c:markdown>
## Installing ColdMVC

Before you can get started creating your application, you need to first install ColdMVC.
After you [download the framework] [1], you have three options for installing it:

1. Create a _/coldmvc_ mapping inside ColdFusion Administrator that points to the framework.
2. Put the framework directly inside your server's web root.
3. Put the framework directly inside your application's root.

The choice is yours.

[1]: /download "Download"
</c:markdown>

<c:markdown>
## Creating your application

Now that ColdMVC is installed, it's time to get started on the application. First, create a new ColdFusion project in your editor of choice and name it _BookStore_.

Since this will be a database-driven web application, you should also create a new database in your database server.
For now, the database can be left completely empty.

Once you've created the database, create a datasource within ColdFusion Administrator that points to your new database and name it _BookStore_.
Technically you can configure the datasource to be named whatever you'd like it to be, but by default ColdMVC will look for a datasource with the same name as the project.

Next, add an _Application.cfc_ inside your _BookStore_ directory with the following content:

	/**
	 * @extends coldmvc.Application
	 */
	component {

	}

At this point, your directory structure should look like the following:

	/BookStore
		Application.cfc
</c:markdown>

<c:markdown>
## Creating a home page

Since ColdMVC follows the MVC design pattern where requests are routed through controllers, we'll start by creating a controller for the bookstore.

Inside your _BookStore_ directory, create a new folder called _app_. This is where the bulk of the code for your application will be located.

Inside the _app_ directory, create a directory called _controllers_. As the name might imply, this is where your application's controllers will be located.

Now, inside _/BookStore/app/controllers/_, create an _IndexController.cfc_ with the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

	}

The _IndexController_ will serve as the home page for the application. At this point it doesn't really do a whole lot, but that's OK.

Next, let's create the view for the home page. In an MVC application, the View is the presentation layer of your application. Simply put, it's where your HTML goes.

Inside the _app_ directory, create a new directory called _views_. This is where your application's views will be located.

Now, create another directory inside _views_ called _index_. This is where any views associated with your _IndexController_ will be located.

Finally, inside _/BookStore/app/views/index/_, create an _index.cfm_ with the following content:

	Welcome to my bookstore!

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				IndexController.cfc
			/views
				/index
					index.cfm
		Application.cfc
</c:markdown>

<c:markdown>
## Testing it out

Now that you've created a simple controller and view for the bookstore, let's test it out.

To do so, create a new directory inside _BookStore_ called _public_. This will be the publicly accessible web root for your application.

Inside the _public_ directory, create an _index.cfm_ with the following content:

	<cfoutput>#open#</cfoutput>cfinclude template="/coldmvc/index.cfm" />

This will be the main [front controller] [1] for your application and act as a centralized entry point for all requests. Basically the file just delegates control of the request to ColdMVC.

Now, open a web browser and test out your application.

If you use _localhost_ for development, go to _http://localhost/bookstore/public/index.cfm_. You should see a really boring page that says "Welcome to my bookstore!".

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				IndexController.cfc
			/views
				/index
					index.cfm
		/public
			index.cfm
		Application.cfc

[1]: http://en.wikipedia.org/wiki/Front_Controller_pattern "Front Controller pattern"
</c:markdown>

<c:markdown>
## Development mode

Your application should now be up and running in all of its limited glory.
However, by default your application runs in _production_ mode, which has enhanced application caching enabled,
but isn't ideal when you're making lots of changes in your development environment.

To make things a little easier on ourselves in development, let's configure our application to run in _development_ mode.

First, create a new directory called _config_ inside the _BookStore_ directory.

Inside the _config_ directory, create a _config.ini_ with the following content:

	[default]

	[development]
	development=true
	autoReload=true

This is your application's main configuration file. Right now the file is turning on _development_ mode and telling the application to reload itself on every request.
More information can be found in the [Config Variables] [1] chapter inside the [Reference Guide] [2].

Also inside the _config_ directory, create an _environment.txt_ with the following content:

	development

This file sets your current environment, which is used to load your config variables.
More information can be found in the [Environments] [3] chapter inside the [Reference Guide] [2].

Now, go back to your browser and reload your application by appending _?init_ to the URL. For example, your URL could now be _http://localhost/bookstore/public/index.cfm?init_.

After the page reloads, you should now see ColdMVC's debug information, which contains a lot of useful stuff, like the current request's controller, action, and view, among other things.

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				IndexController.cfc
			/views
				/index
					index.cfm
		/config
			config.ini
			environment.txt
		/public
			index.cfm
		Application.cfc

[1]: /guide/config-variables "Config Variables"
[2]: /guide "Reference Guide"
[3]: /guide/environments "Environments"
</c:markdown>

<c:markdown>
## Creating a model

Now that you've created a very simple home page for your bookstore, it's time to start working with books.

First, we'll need to create a _Book_ model. This will be a persistent ORM entity that is managed by [Hibernate] [1] behind the scenes.

Inside your _app_ directory, create a directory called _model_. This will be the model of your application, where your business logic and persistent model objects are located.

Inside the _model_ directory, create a _Book.cfc_ with the following content:

	/**
	 * @persistent true
	 * @extends coldmvc.Model
	 */
	component {

		/**
		 * @fieldtype id
		 * @generator increment
		 */
		property id;
		property title;
		property author;
		property description;

	}

You'll notice that the _Book_ model has four properties: an ID, a title, an author, and a description.
If you refresh your page and look at your database, you should see that a table named _Book_ was created for you, with columns that match the properties on your _Book_ model.

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				IndexController.cfc
			/model
				Book.cfc
			/views
				/index
					index.cfm
		/config
			config.ini
			environment.txt
		/public
			index.cfm
		Application.cfc

[1]: http://www.hibernate.org/ "Hibernate"
</c:markdown>

<c:markdown>
## Performing CRUD

Now that you have a _Book_ model created, it's time to perform some [CRUD] [1].

Inside your _controllers_ directory, create a _BookController.cfc_ with the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

	}

This controller will handle the [CRUD] [1] operations on your books.

Next, we'll create a really simple home page view for books.

Inside _/BookStore/app/views/_, create a directory called _book_. This is where all of the views associated with the _BookController_ will be located.

Now create an _index.cfm_ inside the new _book_ directory with the following content:

	<cfoutput>#open#</cfoutput>cfoutput>
	<a href="#linkTo({action='add'})#">Add a Book</a>
	or
	<a href="#linkTo({action='list'})#">List All Books</a>
	<cfoutput>#open#</cfoutput>/cfoutput>

You should now be able to view your book's home page in your browser by going to _http://localhost/bookstore/public/index.cfm/book_.

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				BookController.cfc
				IndexController.cfc
			/model
				Book.cfc
			/views
				/book
					index.cfm
				/index
					index.cfm
		/config
			config.ini
			environment.txt
		/public
			index.cfm
		Application.cfc

[1]: http://en.wikipedia.org/wiki/Create,_read,_update_and_delete "Create, read, update and delete"
</c:markdown>

<c:markdown>
## Adding a book

If you click on the "Add a Book" link on your book's home page, you'll see that nothing happens. Let's change that.

Open up your _BookController_ and update it to the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

		function add() {

			params.book = _Book.new();

		}

	}

You've just added an _add_ action that creates a new instance of a _Book_ and puts it into the _params_ scope.

Next, create an _add.cfm_ inside _/BookStore/app/views/book/_ with the following content:

	<cfoutput>#open#</cfoutput>cfoutput>
	<cfoutput>#open#</cfoutput>c:form action="save" bind="book">
		<cfoutput>#open#</cfoutput>c:input name="title" />
		<cfoutput>#open#</cfoutput>c:input name="author" />
		<cfoutput>#open#</cfoutput>c:textarea name="description" />
		<cfoutput>#open#</cfoutput>c:submit label="Add Book" />
		<cfoutput>#open#</cfoutput>a href="#linkTo({action='list'})#">Back to List<cfoutput>#open#</cfoutput>/a>
	<cfoutput>#open#</cfoutput>/c:form>
	<cfoutput>#open#</cfoutput>/cfoutput>

You've just created a simple form for adding a book using ColdMVC's built-in [custom tags] [1] and bound it to a _Book_ param.

If you go to _http://localhost/bookstore/public/index.cfm/book/add_ and view the page source, you should see something like the following:

	<cfoutput>#open#</cfoutput>form action="http://localhost/bookstore/public/index.cfm/book/save"
		method="post" enctype="multipart/form-data" name="form" id="form">
		<cfoutput>#open#</cfoutput>div class="wrapper" id="wrapper_for_book_title">
			<cfoutput>#open#</cfoutput>div class="label">
				<cfoutput>#open#</cfoutput>label id="label_for_book_title" for="book_title" title="Title">Title:<cfoutput>#open#</cfoutput>/label>
			<cfoutput>#open#</cfoutput>/div>
			<cfoutput>#open#</cfoutput>div class="field">
				<cfoutput>#open#</cfoutput>input type="text" name="book.title" id="book_title" title="Title" value="" />
			<cfoutput>#open#</cfoutput>/div>
		<cfoutput>#open#</cfoutput>/div>
		<cfoutput>#open#</cfoutput>div class="wrapper" id="wrapper_for_book_author">
			<cfoutput>#open#</cfoutput>div class="label">
				<cfoutput>#open#</cfoutput>label id="label_for_book_author" for="book_author" title="Author">Author:<cfoutput>#open#</cfoutput>/label>
			<cfoutput>#open#</cfoutput>/div>
			<cfoutput>#open#</cfoutput>div class="field">
				<cfoutput>#open#</cfoutput>input type="text" name="book.author" id="book_author" title="Author" value="" />
			<cfoutput>#open#</cfoutput>/div>
		<cfoutput>#open#</cfoutput>/div>
		<cfoutput>#open#</cfoutput>div class="wrapper" id="wrapper_for_book_description">
			<cfoutput>#open#</cfoutput>div class="label">
				<cfoutput>#open#</cfoutput>label id="label_for_book_description" for="book_description" title="Description">Description:<cfoutput>#open#</cfoutput>/label>
			<cfoutput>#open#</cfoutput>/div>
			<cfoutput>#open#</cfoutput>div class="field">
				<cfoutput>#open#</cfoutput>textarea name="book.description" id="book_description" title="Description"><cfoutput>#open#</cfoutput>/textarea>
			<cfoutput>#open#</cfoutput>/div>
		<cfoutput>#open#</cfoutput>/div>
		<cfoutput>#open#</cfoutput>span class="button">
			<cfoutput>#open#</cfoutput>input type="submit" name="save" id="save" title="Add Book" class="button" value="Add Book" />
		<cfoutput>#open#</cfoutput>/span>
		<cfoutput>#open#</cfoutput>a href="http://localhost/bookstore/public/index.cfm/book/list">Back to List<cfoutput>#open#</cfoutput>/a>
	<cfoutput>#open#</cfoutput>/form>

Not bad for less than 10 lines of code in the view.

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				BookController.cfc
				IndexController.cfc
			/model
				Book.cfc
			/views
				/book
					add.cfm
					index.cfm
				/index
					index.cfm
		/config
			config.ini
			environment.txt
		/public
			index.cfm
		Application.cfc

[1]: /guide/tags "Tags"
</c:markdown>

<c:markdown>
## Saving a book

Now that we have a form for adding a book, let's save it to the database.

You'll notice that the add form that we just created has an action of _save_, so let's add that action to our _BookController_.

Once again, open up your _BookController_ and update it to the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

		function add() {

			params.book = _Book.new();

		}

		function save() {

			var book = _Book.new(params.book);

			book.save();

		}

	}

If you fill out your form and submit it, you should see a new record created in your database.
</c:markdown>

<c:markdown>
## Viewing a book

Now that you were able to add a book to your database, let's display the newly created record.

Let's start by updating the _BookController_ to the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

		function add() {

			params.book = _Book.new();

		}

		function save() {

			var book = _Book.new(params.book);

			book.save();

			redirect({action="show", id=book});

		}

		function show() {

			params.book = _Book.get(params.id);

		}

	}

You'll notice the _BookController_'s _save_ action now has logic to redirect to the _show_ action after the book is saved.

Now let's add the view. Create a _show.cfm_ inside _/BookStore/app/views/book/_ with the following content:

	<cfoutput>#open#</cfoutput>cfoutput>
	<cfoutput>#open#</cfoutput>c:bind to="book">
		<cfoutput>#open#</cfoutput>c:text name="id" />
		<cfoutput>#open#</cfoutput>c:text name="title" />
		<cfoutput>#open#</cfoutput>c:text name="author" />
		<cfoutput>#open#</cfoutput>c:text name="description" />
	<cfoutput>#open#</cfoutput>/c:bind>

	<cfoutput>#open#</cfoutput>a href="#linkTo({action='list'})#">Back to List<cfoutput>#open#</cfoutput>/a>
	<cfoutput>#open#</cfoutput>/cfoutput>

If you save another book, you will be redirected to the new book's _show_ page.

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				BookController.cfc
				IndexController.cfc
			/model
				Book.cfc
			/views
				/book
					add.cfm
					index.cfm
					show.cfm
				/index
					index.cfm
		/config
			config.ini
			environment.txt
		/public
			index.cfm
		Application.cfc
</c:markdown>

<c:markdown>
## Listing books

Now that we can add and view newly created books, let's create a page to display all of the books in the database.

Once again, open your _BookController_ and update it to the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

		function add() {

			params.book = _Book.new();

		}

		function save() {

			var book = _Book.new(params.book);

			book.save();

			redirect({action="show", id=book});

		}

		function show() {

			params.book = _Book.get(params.id);

		}

		function list() {

			params.books = _Book.list({
				sort = "title",
				order = "asc"
			});

		}

	}

You've now added a _list_ action that lists all of the books in the database and sorts them by their title in ascending order.

Next, let's create the view that displays the books.

Create a _list.cfm_ located inside _/BookStore/app/views/book/_ with the following content:

	<cfoutput>#open#</cfoutput>cfoutput>
	<cfoutput>#open#</cfoutput>table>
		<cfoutput>#open#</cfoutput>thead>
			<cfoutput>#open#</cfoutput>th>ID<cfoutput>#open#</cfoutput>/th>
			<cfoutput>#open#</cfoutput>th>Title<cfoutput>#open#</cfoutput>/th>
			<cfoutput>#open#</cfoutput>th>Author<cfoutput>#open#</cfoutput>/th>
			<cfoutput>#open#</cfoutput>th>&nbsp;<cfoutput>#open#</cfoutput>/th>
			<cfoutput>#open#</cfoutput>th>&nbsp;<cfoutput>#open#</cfoutput>/th>
		<cfoutput>#open#</cfoutput>/thead>
		<cfoutput>#open#</cfoutput>tbody>
			<cfoutput>#open#</cfoutput>c:each in="#books#" do="book">
				<cfoutput>#open#</cfoutput>tr>
					<cfoutput>#open#</cfoutput>td><cfoutput>#open#</cfoutput>a href="#linkTo({action='show', id=book})#">#book.id()#<cfoutput>#open#</cfoutput>/a><cfoutput>#open#</cfoutput>/td>
					<cfoutput>#open#</cfoutput>td>#book.title()#<cfoutput>#open#</cfoutput>/td>
					<cfoutput>#open#</cfoutput>td>#book.author()#<cfoutput>#open#</cfoutput>/td>
					<cfoutput>#open#</cfoutput>td><cfoutput>#open#</cfoutput>a href="#linkTo({action='edit', id=book})#">Edit<cfoutput>#open#</cfoutput>/a><cfoutput>#open#</cfoutput>/td>
					<cfoutput>#open#</cfoutput>td><cfoutput>#open#</cfoutput>a href="#linkTo({action='delete', id=book})#">Delete<cfoutput>#open#</cfoutput>/a><cfoutput>#open#</cfoutput>/td>
				<cfoutput>#open#</cfoutput>/tr>
			<cfoutput>#open#</cfoutput>/c:each>
		<cfoutput>#open#</cfoutput>/tbody>
	<cfoutput>#open#</cfoutput>/table>

	<cfoutput>#open#</cfoutput>a href="#linkTo({action='add'})#">Add a Book<cfoutput>#open#</cfoutput>/a>
	<cfoutput>#open#</cfoutput>/cfoutput>

If you go to _http://localhost/bookstore/public/index.cfm/book/list_, you should see a table with all of the books in your database.

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				BookController.cfc
				IndexController.cfc
			/model
				Book.cfc
			/views
				/book
					add.cfm
					index.cfm
					list.cfm
					show.cfm
				/index
					index.cfm
		/config
			config.ini
			environment.txt
		/public
			index.cfm
		Application.cfc
</c:markdown>

<c:markdown>
## Editing books

You'll notice the book list included a link to edit each book, so let's add that action to the application.

Open your _BookController_ and update it to the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

		function add() {

			params.book = _Book.new();

		}

		function save() {

			var book = _Book.new(params.book);

			book.save();

			redirect({action="show", id=book});

		}

		function show() {

			params.book = _Book.get(params.id);

		}

		function list() {

			params.books = _Book.list({
				sort = "title",
				order = "asc"
			});

		}

		function edit() {

			params.book = _Book.get(params.id);

		}

	}

You've just added an _edit_ action that finds a book by its ID and puts it into the _params_ scope.

Now let's create the form for editing a book's information. This form will look very similar to your add form.

Inside _/BookStore/app/views/book/_, create an _edit.cfm_ with the following content:

	<cfoutput>#open#</cfoutput>cfoutput>
	<cfoutput>#open#</cfoutput>c:form action="update" bind="book">
		<cfoutput>#open#</cfoutput>c:hidden name="id" />
		<cfoutput>#open#</cfoutput>c:input name="title" />
		<cfoutput>#open#</cfoutput>c:input name="author" />
		<cfoutput>#open#</cfoutput>c:textarea name="description" />
		<cfoutput>#open#</cfoutput>c:submit label="Update Book" />
		<cfoutput>#open#</cfoutput>a href="#linkTo({action='show', id=book})#">Cancel<cfoutput>#open#</cfoutput>/a>
		<cfoutput>#open#</cfoutput>a href="#linkTo({action='list'})#">Back to List<cfoutput>#open#</cfoutput>/a>
	<cfoutput>#open#</cfoutput>/c:form>
	<cfoutput>#open#</cfoutput>/cfoutput>

You'll notice this form posts to the _BookController_'s _update_ action, so let's add that as well.

Update your _BookController_ to the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

		function add() {

			params.book = _Book.new();

		}

		function save() {

			var book = _Book.new(params.book);

			book.save();

			redirect({action="show", id=book});

		}

		function show() {

			params.book = _Book.get(params.id);

		}

		function list() {

			params.books = _Book.list({
				sort = "title",
				order = "asc"
			});

		}

		function edit() {

			params.book = _Book.get(params.id);

		}

		function update() {

			var book = _Book.get(params.book.id, params.book);

			book.save();

			redirect({action="show", id=book});

		}

	}

The new _update_ action will find a book by its ID, populate and save it.

After the book has been updated, the browser is redirected back to the _show_ action.

While we're at it, let's add some links to the _show_ view. Update _/BookStore/app/views/book/show.cfm_ to the following content:

	<cfoutput>#open#</cfoutput>cfoutput>
	<cfoutput>#open#</cfoutput>c:bind to="book">
		<cfoutput>#open#</cfoutput>c:text name="id" />
		<cfoutput>#open#</cfoutput>c:text name="title" />
		<cfoutput>#open#</cfoutput>c:text name="author" />
		<cfoutput>#open#</cfoutput>c:text name="description" />
	<cfoutput>#open#</cfoutput>/c:bind>

	<cfoutput>#open#</cfoutput>a href="#linkTo({action='edit', id=book})#">Edit<cfoutput>#open#</cfoutput>/a>
	<cfoutput>#open#</cfoutput>a href="#linkTo({action='delete', id=book})#">Delete<cfoutput>#open#</cfoutput>/a>
	<cfoutput>#open#</cfoutput>a href="#linkTo({action='list'})#">Back to List<cfoutput>#open#</cfoutput>/a>
	<cfoutput>#open#</cfoutput>/cfoutput>

At this point, your directory structure should look like the following:

	/BookStore
		/app
			/controllers
				BookController.cfc
				IndexController.cfc
			/model
				Book.cfc
			/views
				/book
					add.cfm
					edit.cfm
					index.cfm
					list.cfm
					show.cfm
				/index
					index.cfm
		/config
			config.ini
			environment.txt
		/public
			index.cfm
		Application.cfc
</c:markdown>

<c:markdown>
## Deleting books

The book list also included a link to delete books, so let's add that action as well.

Update your _BookController_ to the following content:

	/**
	 * @extends coldmvc.Controller
	 */
	component {

		function add() {

			params.book = _Book.new();

		}

		function save() {

			var book = _Book.new(params.book);

			book.save();

			redirect({action="show", id=book});

		}

		function show() {

			params.book = _Book.get(params.id);

		}

		function list() {

			params.books = _Book.list({
				sort = "title",
				order = "asc"
			});

		}

		function edit() {

			params.book = _Book.get(params.id);

		}

		function update() {

			var book = _Book.get(params.book.id, params.book);

			book.save();

			redirect({action="show", id=book});

		}

		function delete() {

			var book = _Book.get(params.id);

			book.delete();

			redirect({action="list"});

		}

	}

The new _delete_ action will find a book by its ID, delete it, then redirect to the _list_ action.

Congratulations! You've successfully handled all [CRUD] [1] operations for books.

[1]: http://en.wikipedia.org/wiki/Create,_read,_update_and_delete "Create, read, update and delete"
</c:markdown>

<c:markdown>
## Adding a layout

The last item to cover in this tutorial will be layouts.
We won't go very detailed into layouts, but more information can be found inside the [Layouts] [2] chapter in the [Reference Guide] [3].

Inside _/BookStore/app/_, create a directory called _layouts_.

Inside the _layouts_ directory, create an _index.cfm_ with the following content:

	<cfoutput>#open#</cfoutput>c:doctype />
	<cfoutput>#open#</cfoutput>c:html>
		<cfoutput>#open#</cfoutput>head>
			<cfoutput>#open#</cfoutput>c:version />
			<cfoutput>#open#</cfoutput>title>My Bookstore<cfoutput>#open#</cfoutput>/title>
			<cfoutput>#open#</cfoutput>c:content_type />
		<cfoutput>#open#</cfoutput>/head>
		<cfoutput>#open#</cfoutput>body>
			<cfoutput>#open#</cfoutput>h1>My Bookstore<cfoutput>#open#</cfoutput>/h1>
			<cfoutput>#open#</cfoutput>c:render />
		<cfoutput>#open#</cfoutput>/body>
	<cfoutput>#open#</cfoutput>/c:html>

This will be the site-wide layout for your entire application.

Now if you view your application in your browser again, you'll notice each view will be displayed inside the layout where it calls _&lt;c:render /&gt;_.

Again, more information can be found inside the chapter on [Layouts] [2] in the [Reference Guide] [3].

[1]: http://en.wikipedia.org/wiki/Create,_read,_update_and_delete "Create, read, update and delete"
[2]: /guide/layouts "Layouts"
[3]: /guide "Reference Guide"
</c:markdown>

<c:markdown>
## Closing thoughts

All of the code in this tutorial is available on GitHub at [https://github.com/tonynelson19/ColdMVC-Samples/tree/master/BookStore] [1].

Thanks for your time and I hope you enjoy working with ColdMVC.

[1]: https://github.com/tonynelson19/ColdMVC-Samples/tree/master/BookStore
</c:markdown>