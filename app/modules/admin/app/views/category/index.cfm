<cfoutput>
<div class="container">
	<h1>Categories</h1>
	<c:table>
		<thead>
			<tr>
				<th>Order</th>
				<th>Name</th>
				<th>Chapters</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:each in="#categories#" do="category">
				<tr>
					<td>#escape(category.order())#</td>
					<td>#escape(category.name())#</td>
					<td>#arrayLen(category.chapters())#</td>
					<td><a href="#linkTo({action='edit', id=category})#">Edit</a></td>
					<td><a href="#linkTo({action='delete', id=category})#">Delete</a></td>
				</tr>
			</c:each>
		</tbody>
	</c:table>
	<c:button url="#linkTo({action='add'})#" label="Add New Category" class="primary" />
</div>
</cfoutput>