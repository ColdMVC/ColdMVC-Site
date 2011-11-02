<!-- <cfset addBreadcrumb(category.name()) /> -->

<div class="container">
	<h1>Edit Category</h1>
	<c:form bind="category">
		<c:number name="order" />
		<c:input name="name" />
		<c:input name="slug" />
		<c:buttons>
			<c:submit />
		</c:buttons>
	</c:form>
</div>