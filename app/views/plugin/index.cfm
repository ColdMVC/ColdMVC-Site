<c:markdown>
# Need something extra?
</c:markdown>

<cfoutput>
<dl class="list">
	<c:each in="#plugins#" do="plugin" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({controller='plugin', action='show', id=plugin})#" title="#plugin.name()#">#plugin.name()#</a></dt>
		<dd>#plugin.description()#</dd>
	</c:each>
</dl>
</cfoutput>