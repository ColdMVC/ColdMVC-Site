<c:valid_page record="#tag#" />

<cfoutput>
<h1>#tag.name()#</h1>
<c:content title="Description" text="#tag.description()#" />
<c:content title="Overview" text="#tag.overview()#" />
<c:content title="Parameters" text="#tag.parameters()#" />
<c:content title="Example" text="#tag.example()#" />
<c:content title="URL">
	<a href="#tag.url()#" title="#tag.url()#" target="_blank">#tag.url()#</a>
</c:content>
</cfoutput>