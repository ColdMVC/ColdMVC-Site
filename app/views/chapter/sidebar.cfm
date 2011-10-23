<cfoutput>
<h3>Browse Chapters</h3>
<ol>
	<c:each in="#chapters#" do="chapter" index="i">
		<li><a href="#linkTo({action='show', id=chapter})#" title="#chapter.name()#">#chapter.name()#</a></li>
	</c:each>
</ol>
</cfoutput>