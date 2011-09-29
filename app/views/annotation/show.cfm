<s:valid_page record="#annotation#" />

<cfoutput>
<h1>#annotation.name()#</h1>
<s:content title="Description" text="#annotation.description()#" />
<s:content title="Overview" text="#annotation.overview()#" />
<s:content title="Example" text="#annotation.example()#" />

<c:content key="sidebar">
	<h3>Browse Annotations</h3>
	<ul>
		<c:each in="#annotations#" do="annotation">
			<li><a href="#linkTo({action='show', id=annotation})#" title="#annotation.name()#">#annotation.name()#</a></li>
		</c:each>
	</ul>
</c:content>
</cfoutput>