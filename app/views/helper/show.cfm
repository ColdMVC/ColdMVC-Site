<c:valid_page record="#helper#" />

<cfoutput>
<h1>#helper.name()#</h1>

<c:content title="Description" text="#helper.description()#" />
<c:content title="Parameters" text="#helper.parameters()#" />
<c:content title="Example" text="#helper.example()#" />
</cfoutput>