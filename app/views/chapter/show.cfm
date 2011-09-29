<s:valid_page record="#chapter#" />

<cfoutput>
<h1>#chapter.name()#</h1>
<s:content id="chapter" text="#chapter.content()#" />
<s:wizard_navigation />

<c:content key="sidebar">
	<h3>Browse Chapters</h3>
	<ol>
		<c:each in="#chapters#" do="chapter" index="i">
			<li><a href="#linkTo({action='show', id=chapter})#" title="#chapter.name()#">#chapter.name()#</a></li>
		</c:each>
	</ol>
</c:content>
</cfoutput>