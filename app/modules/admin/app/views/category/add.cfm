<cfset setTitle("Add a Category") />

<div class="container">
	<h1>Add a Category</h1>
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
</div>