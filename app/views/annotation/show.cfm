<c:valid_page record="#annotation#" />

<cfoutput>
<h1>#annotation.name()#</h1>

<c:content title="Description" text="#annotation.description()#" />
<c:content title="Example" text="#annotation.example()#" />
</cfoutput>