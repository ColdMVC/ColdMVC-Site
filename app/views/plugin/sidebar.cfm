<cfoutput>
<h3>Browse Plugins</h3>
<ul>
	<c:each in="#plugins#" do="plugin">
		<li><a href="#linkTo({action='show', id=plugin})#" title="#plugin.name()#">#plugin.name()#</a></li>
	</c:each>
</ul>
</cfoutput>