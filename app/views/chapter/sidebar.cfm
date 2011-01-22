<cfoutput>
<cfif arrayLen(chapters) gt 0>
	<h3>Browse Chapters</h3>
	<ol>
		<c:each in="#chapters#" do="chapter" index="i">
			<li><a href="#linkTo({controller='chapter', action='show', id=chapter})#" title="#chapter.name()#">#chapter.name()#</a></li>
		</c:each>
	</ol>
</cfif>
</cfoutput>