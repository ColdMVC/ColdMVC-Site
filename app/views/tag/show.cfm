<s:valid_page record="#tag#" />

<cfoutput>
<h1>#tag.name()#</h1>
<s:content title="Description" text="#tag.description()#" />
<s:content title="Overview" text="#tag.overview()#" />
<s:content title="Parameters" text="#tag.parameters()#" />
<s:content title="Example" text="#tag.example()#" />
<s:content title="URL">
	<a href="#tag.url()#" title="#tag.url()#" target="_blank">#tag.url()#</a>
</s:content>
</cfoutput>