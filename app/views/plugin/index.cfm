<c:markdown>
# Need something extra?

If you have a plugin that you'd like to share, let us know by sending an email to <coldmvc@gmail.com>.

For more information on plugins, check out the chapter on plugins in the [Reference Guide] [1].

[1]: /chapters/plugins
</c:markdown>

<cfoutput>
<dl class="list">
	<c:each in="#plugins#" do="plugin" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({controller='plugin', action='show', id=plugin})#" title="#plugin.name()#">#plugin.name()#</a></dt>
		<dd>#plugin.description()#</dd>
	</c:each>
</dl>
</cfoutput>