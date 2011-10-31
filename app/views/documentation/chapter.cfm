<cfset category = chapter.category() />
<cfset setTitle(chapter.title()) />
<cfset addBreadcrumb(linkTo("category", {category=category}), category.name()) />
<cfset addBreadcrumb(linkTo("chapter", {category=category, chapter=chapter}), chapter.title()) />

<cfoutput>
<div class="container">
	<div class="row">
		<div class="span12">
			<h1>#chapter.name()#</h1>
			#chapter.html()#
			<c:each in="#chapter.articles()#" do="article">
				<h2>#escape(article.title())#</h2>
				#article.html()#
			</c:each>
		</div>
		<div class="span4">
			<ul>
				<c:each in="#categories#" do="category">
					<li>
						<h2><a href="#linkTo('category', {category=category})#">#escape(category.name())#</a></h2>
						<ul>
							<c:each in="#category.chapters()#" do="chapter">
								<li><a href="#linkTo('chapter', {category=category, chapter=chapter})#">#escape(chapter.title())#</a></li>
							</c:each>
						</ul>
					</li>
				</c:each>
			</ul>
		</div>
	</div>
</div>
</cfoutput>