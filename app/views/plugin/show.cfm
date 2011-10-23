<cfset setTitle(plugin.name()) />
<cfset addBreadcrumb(linkTo({id=plugin}), plugin.name()) />

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
</cfoutput>