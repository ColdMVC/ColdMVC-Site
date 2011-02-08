<c:valid_page record="#chapter#" />

<cfoutput>
<h1>#chapter.name()#</h1>
<c:content id="chapter" text="#chapter.content()#" />
<c:wizard_navigation />
</cfoutput>