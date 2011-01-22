<c:valid_page record="#chapter#" />

<cfoutput>
<h1>#chapter.name()#</h1>

<c:content title="Description" text="#chapter.description()#" />
<c:content title="Example" text="#chapter.example()#" />

<c:wizard_navigation />
</cfoutput>