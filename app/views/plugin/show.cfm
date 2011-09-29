<s:valid_page record="#plugin#" />

<cfoutput>
<h1>#plugin.name()#</h1>
<s:content title="Author">
	#plugin.author()#
</s:content>
<s:content title="URL">
	<a href="#plugin.url()#" target="_blank">#plugin.url()#</a>
</s:content>
<s:content title="Description" text="#plugin.description()#" />
<s:content title="Overview" text="#plugin.overview()#" />
<s:content title="Example" text="#plugin.example()#" />

<c:content key="sidebar">
	<h3>Browse Plugins</h3>
	<ul>
		<c:each in="#plugins#" do="plugin">
			<li><a href="#linkTo({action='show', id=plugin})#" title="#plugin.name()#">#plugin.name()#</a></li>
		</c:each>
	</ul>
</c:content>
</cfoutput>