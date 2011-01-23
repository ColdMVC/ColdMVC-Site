<cfoutput>
<h1>Helpers</h1>
<dl class="list">
	<c:each in="#helpers#" do="helper" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({controller='helper', action='show', id=helper})#" title="#helper.name()#">#helper.name()#</a></dt>
		<dd>#helper.description()#</dd>
	</c:each>
</dl>
</cfoutput>