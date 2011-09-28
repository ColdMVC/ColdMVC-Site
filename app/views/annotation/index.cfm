<cfoutput>
<h1>Annotations</h1>
<dl class="list">
	<c:each in="#annotations#" do="annotation" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({action='show', id=annotation})#" title="#annotation.name()#">#annotation.name()#</a></dt>
		<dd>#annotation.description()#</dd>
	</c:each>
</dl>
</cfoutput>