<cfoutput>
<h1>Custom Tags</h1>
<dl class="list">
	<c:each in="#tags#" do="tag" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({action='show', id=tag})#" title="#tag.name()#">#tag.name()#</a></dt>
		<dd>#tag.description()#</dd>
	</c:each>
</dl>
</cfoutput>