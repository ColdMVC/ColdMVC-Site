<cfoutput>
<h3>Browse Annotations</h3>
<ul>
	<c:each in="#annotations#" do="annotation">
		<li><a href="#linkTo({action='show', id=annotation})#" title="#annotation.name()#">#annotation.name()#</a></li>
	</c:each>
</ul>
</cfoutput>