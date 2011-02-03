<c:valid_page record="#helper#" />

<cfoutput>
<h1>#helper.name()#</h1>
<c:content title="Description" text="#helper.description()#" />
<c:content title="Overview" text="#helper.overview()#" />
<c:content title="Parameters" text="#helper.parameters()#" />
<c:content title="Example" text="#helper.example()#" />
<c:content title="URL">
	<a href="#helper.url()#" title="#helper.url()#" target="_blank">#helper.url()#</a>
</c:content>
</cfoutput>