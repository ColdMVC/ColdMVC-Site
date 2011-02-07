<c:valid_page record="#plugin#" />

<cfoutput>
<h1>#plugin.name()#</h1>
<c:content title="Description" text="#plugin.description()#" />
<c:content title="Overview" text="#plugin.overview()#" />
<c:content title="Plugin" text="#plugin.example()#" />
</cfoutput>