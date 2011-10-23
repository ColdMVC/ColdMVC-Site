<cfset setTitle("Plugins") />

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

<c:content key="sidebar">
<c:markdown>
### About Plugins

Plugins are a great way of extending the functionality of the framework without modifying the core files.

For more information on plugins, check out the [chapter on plugins] [1] in the [Reference Guide] [2].

If you have any questions about plugins, post a message to the [Group] [3] or send an email to <coldmvc@gmail.com>.

If you have a plugin that you'd like to list on the site, [we'd love to see it] [4].

[1]: /guide/plugins
[2]: /guide
[3]: http://groups.google.com/group/coldmvc "ColdMVC | Google Groups"
[4]: /submit-plugin
</c:markdown>
</c:content>