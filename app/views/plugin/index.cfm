<c:markdown>
# Need something extra?
</c:markdown>

<cfoutput>
<dl class="list">
	<c:each in="#plugins#" do="plugin" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({action='show', id=plugin})#" title="#plugin.name()#">#plugin.name()#</a></dt>
		<dd>
			<cfif plugin.description() neq "">
				#plugin.description()#
			</cfif>
			<a href="#plugin.url()#" target="_blank">#plugin.url()#</a>
		</dd>
	</c:each>
</dl>
</cfoutput>