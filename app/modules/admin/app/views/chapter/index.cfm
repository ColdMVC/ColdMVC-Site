<cfset setTitle("Chapters") />

<cfoutput>
<div class="container">
	<h1>Chapters</h1>
	<form>
		<ul class="filters">
			<li><c:select name="category" wrapper="false" /></li>
			<li><c:select name="status" wrapper="false" /></li>
		</ul>
	</form>
	<c:table>
		<thead>
			<tr>
				<th>Category</th>
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
			<c:each in="#chapters#" do="chapter">
				<tr>
					<td>#escape(chapter.category().name())#</td>
					<td>#escape(chapter.order())#</td>
					<td>#escape(chapter.name())#</td>
					<td>#yesNoFormat(chapter.hasText())#</td>
					<td>#arrayLen(chapter.articles())#</td>
					<td>#escape(chapter.status())#</td>
					<td><a href="#linkTo({action='edit', id=chapter})#">Edit</a></td>
					<td><a href="#linkTo({action='delete', id=chapter})#" data-confirm="Are you sure you want to delete this chapter?">Delete</a></td>
				</tr>
			</c:each>
		</tbody>
	</c:table>
	<c:button url="#linkTo({action='add'})#" label="Add a Chapter" class="primary" />
</div>
</cfoutput>