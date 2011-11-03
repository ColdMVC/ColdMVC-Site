<cfset setTitle("Categories") />

<cfoutput>
<div class="container">
	<h1>Categories</h1>
	<form>
		<ul class="filters">
			<li><c:select name="status" wrapper="false" /></li>
		</ul>
	</form>
	<c:table>
		<thead>
			<tr>
				<th>Order</th>
				<th>Name</th>
				<th>Text</th>
				<th>Chapters</th>
				<th>Status</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:each in="#categories#" do="category">
				<tr>
					<td>#escape(category.order())#</td>
					<td>#escape(category.name())#</td>
					<td>#yesNoFormat(category.hasText())#</td>
					<td>#arrayLen(category.chapters())#</td>
					<td>#escape(category.status())#</td>
					<td><a href="#linkTo({action='edit', id=category})#">Edit</a></td>
					<td><a href="#linkTo({action='delete', id=category})#" data-confirm="Are you sure you want to delete this category?">Delete</a></td>
				</tr>
			</c:each>
		</tbody>
	</c:table>
	<c:button url="#linkTo({action='add'})#" label="Add a Category" class="primary" />
</div>
</cfoutput>