<cfset setTitle(helper.name()) />
<cfset addBreadcrumb(linkTo({id=helper}), helper.name()) />

<cfoutput>
<h1>#helper.name()#</h1>
<s:content title="Description" text="#helper.description()#" />
<s:content title="Overview" text="#helper.overview()#" />
<s:content title="Parameters" text="#helper.parameters()#" />
<s:content title="Example" text="#helper.example()#" />
<s:content title="URL">
	<a href="#helper.url()#" title="#helper.url()#" target="_blank">#helper.url()#</a>
</s:content>
</cfoutput>