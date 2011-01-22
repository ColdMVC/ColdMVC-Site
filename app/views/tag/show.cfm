<c:valid_page record="#tag#" />

<cfoutput>
<h1>#tag.name()#</h1>

<c:content title="Description" text="#tag.description()#" />
<c:content title="Parameters" text="#tag.parameters()#" />
<c:content title="Example" text="#tag.example()#" />
</cfoutput>