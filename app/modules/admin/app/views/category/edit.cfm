<cfset setTitle("Edit Category: " & category.name()) />
<cfset addBreadcrumb(category.name()) />

<cfoutput>
<div class="container">
	<h1>Edit Category</h1>
	<c:form bind="category">
		<c:number name="order" />
		<c:input name="name" />
		<c:textarea name="text" />
		<c:select name="status" />
		<c:buttons>
			<c:submit />
			<c:button url="#linkTo({action='index'})#" label="Cancel" />
		</c:buttons>
	</c:form>
	<h2>Chapters</h2>
	<c:table>
		<thead>
			<tr>
				<th>Order</th>
				<th>Name</th>
				<th>Text</th>
				<th>Articles</th>
				<th>Status</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:each in="#category.chapters()#" do="chapter">
				<tr>
					<td>#escape(chapter.order())#</td>
					<td>#escape(chapter.name())#</td>
					<td>#yesNoFormat(chapter.hasText())#</td>
					<td>#arrayLen(chapter.articles())#</td>
					<td>#escape(chapter.status())#</td>
					<td><a href="#linkTo({controller='chapter', action='edit', id=chapter})#">Edit</a></td>
					<td><a href="#linkTo({controller='chapter', action='delete', id=chapter})#" data-confirm="Are you sure you want to delete this chapter?">Delete</a></td>
				</tr>
			</c:each>
			<cfif arrayLen(category.chapters()) eq 0>
				<tr>
					<td colspan="7">None</td>
				</tr>
			</cfif>
		</tbody>
	</c:table>
</div>
</cfoutput>