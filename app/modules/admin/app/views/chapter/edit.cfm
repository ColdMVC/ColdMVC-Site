<cfset category = chapter.category() />

<cfset setTitle("Edit Chapter: " & chapter.name()) />
<cfset addBreadcrumb(linkTo("admin:category.edit", {id=category}), category.name()) />
<cfset addBreadcrumb(chapter.name()) />

<cfoutput>
<div class="container">
	<h1>Edit Chapter</h1>
	<c:form bind="chapter">
		<c:select name="category" />
		<c:number name="order" />
		<c:input name="name" />
		<c:textarea name="text" />
		<c:select name="status" />
		<c:buttons>
			<c:submit />
			<c:button url="#linkTo({action='index'})#" label="Cancel" />
		</c:buttons>
	</c:form>
	<h2>Articles</h2>
	<c:table>
		<thead>
			<tr>
				<th>Order</th>
				<th>Name</th>
				<th>Text</th>
				<th>Status</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:each in="#chapter.articles()#" do="article">
				<tr>
					<td>#escape(article.order())#</td>
					<td>#escape(article.name())#</td>
					<td>#yesNoFormat(article.hasText())#</td>
					<td>#escape(article.status())#</td>
					<td><a href="#linkTo({controller='article', action='edit', id=article})#">Edit</a></td>
					<td><a href="#linkTo({controller='article', action='delete', id=article})#" data-confirm="Are you sure you want to delete this article?">Delete</a></td>
				</tr>
			</c:each>
			<cfif arrayLen(chapter.articles()) eq 0>
				<tr>
					<td colspan="6">None</td>
				</tr>
			</cfif>
		</tbody>
	</c:table>
</div>
</cfoutput>