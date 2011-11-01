<cfset setTitle("Documentation") />

<cfoutput>
<div class="container" id="documentation">
	<h1>Looking for something?</h1>
	<div class="row">
		<c:each in="#categories#" do="category">
			<div class="span4">
				<h2>#escape(category.name())#</h2>
				<ul>
					<c:each in="#category.chapters()#" do="chapter">
						<li><a href="#linkTo('chapter', {category=category, chapter=chapter})#">#escape(chapter.title())#</a></li>
					</c:each>
				</ul>
			</div>
		</c:each>
	</div>
</div>
</cfoutput>