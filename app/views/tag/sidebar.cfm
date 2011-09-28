<cfoutput>
<cfif arrayLen(tags) gt 0>
	<h3>Browse Tags</h3>
	<ul>
		<c:each in="#tags#" do="tag">
			<li><a href="#linkTo({action='show', id=tag})#" title="#tag.name()#">#tag.name()#</a></li>
		</c:each>
	</ul>
</cfif>
</cfoutput>