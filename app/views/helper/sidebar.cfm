<cfoutput>
<cfif arrayLen(helpers) gt 0>
	<h3>Browse Helpers</h3>
	<ul>
		<c:each in="#helpers#" do="helper">
			<li><a href="#linkTo({controller='helper', action='show', id=helper})#" title="#helper.name()#">#helper.name()#</a></li>
		</c:each>
	</ul>
</cfif>
</cfoutput>