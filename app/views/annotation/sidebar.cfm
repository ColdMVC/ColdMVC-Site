<cfoutput>
<cfif arrayLen(annotations) gt 0>
	<h3>Browse Annotations</h3>
	<ul>
		<c:each in="#annotations#" do="annotation">
			<li><a href="#linkTo({controller='annotation', action='show', id=annotation})#" title="#annotation.name()#">#annotation.name()#</a></li>
		</c:each>
	</ul>
</cfif>
</cfoutput>