<cfset setTitle("Add a Chapter") />

<div class="container">
	<h1>Add a Chapter</h1>
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
</div>