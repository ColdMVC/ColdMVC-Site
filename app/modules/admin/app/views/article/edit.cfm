<cfset chapter = article.chapter() />
<cfset category = chapter.category() />

<cfset setTitle("Edit Article: " & article.name()) />
<cfset addBreadcrumb(linkTo("admin:category.edit", {id=category}), category.name()) />
<cfset addBreadcrumb(linkTo("admin:chapter.edit", {id=chapter}), chapter.name()) />
<cfset addBreadcrumb(article.name()) />

<cfoutput>
<div class="container">
	<h1>Edit Article</h1>
	<c:form bind="article">
		<c:select name="chapter" />
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
</cfoutput>