<cfoutput>
<h3>Browse Helpers</h3>
<ul>
	<c:each in="#helpers#" do="helper">
		<li><a href="#linkTo({action='show', id=helper})#" title="#helper.name()#">#helper.name()#</a></li>
	</c:each>
</ul>
</cfoutput>