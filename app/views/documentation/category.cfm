<cfset setTitle(category.title()) />
<cfset addBreadcrumb(linkTo("category", {category=category}), category.name()) />

<cfoutput>
<div class="container">
	<div class="row">
		<div class="span12">
			<h1>#category.name()#</h1>
			#category.html()#
			<ul>
				<c:each in="#category.chapters()#" do="chapter">
					<li><a href="#linkTo('chapter', {category=category, chapter=chapter})#">#escape(chapter.title())#</a></li>
				</c:each>
			</ul>
		</div>
		<div class="span4">
			<ul>
				<c:each in="#categories#" do="category">
					<li>
						<h2>#escape(category.name())#</h2>
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