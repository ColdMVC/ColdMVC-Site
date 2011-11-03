<cfset setTitle("Articles") />

<cfoutput>
<div class="container">
	<h1>Articles</h1>
	<form>
		<ul class="filters">
			<li><c:select name="category" wrapper="false" /></li>
			<li><c:select name="chapter" wrapper="false" /></li>
			<li><c:select name="status" wrapper="false" /></li>
		</ul>
	</form>
	<c:table>
		<thead>
			<tr>
				<th>Chapter</th>
				<th>Category</th>
				<th>Order</th>
				<th>Name</th>
				<th>Text</th>
				<th>Status</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:each in="#articles#" do="article">
				<tr>
					<td>#escape(article.chapter().category().name())#</td>
					<td>#escape(article.chapter().name())#</td>
					<td>#escape(article.order())#</td>
					<td>#escape(article.name())#</td>
					<td>#yesNoFormat(article.hasText())#</td>
					<td>#escape(article.status())#</td>
					<td><a href="#linkTo({action='edit', id=article})#">Edit</a></td>
					<td><a href="#linkTo({action='delete', id=article})#" data-confirm="Are you sure you want to delete this article?">Delete</a></td>
				</tr>
			</c:each>
		</tbody>
	</c:table>
	<c:button url="#linkTo({action='add'})#" label="Add an Article" class="primary" />
</div>
</cfoutput>