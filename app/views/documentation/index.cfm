<cfset setTitle("Documentation") />

<cfoutput>
<div class="container" id="documentation">
	<h1>Looking for something?</h1>
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
</cfoutput>