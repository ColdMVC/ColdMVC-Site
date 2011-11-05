<cfset category = chapter.category() />
<cfset setTitle(chapter.name()) />
<cfset addBreadcrumb(linkTo("category", {category=category}), category.name()) />
<cfset addBreadcrumb(linkTo("chapter", {category=category, chapter=chapter}), chapter.name()) />

<cfoutput>
<div class="container">
	<div class="row">
		<div class="span12">
			<h1>#chapter.name()#</h1>
			#chapter.html()#
			<c:each in="#chapter.getActiveArticles()#" do="article">
				<div class="article">
					<h2>#escape(article.name())#</h2>
					#article.html()#
				</div>
			</c:each>
		</div>
		<div class="span4">
			<ul>
				<c:each in="#categories#" do="category">
					<li>
						<h2>#escape(category.name())#</h2>
						<ul>
							<c:each in="#category.getActiveChapters()#" do="chapter">
								<li><a href="#linkTo('chapter', {category=category, chapter=chapter})#">#escape(chapter.name())#</a></li>
							</c:each>
						</ul>
					</li>
				</c:each>
			</ul>
		</div>
	</div>
</div>
</cfoutput>