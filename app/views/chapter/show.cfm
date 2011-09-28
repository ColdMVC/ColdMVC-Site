<s:valid_page record="#chapter#" />

<cfoutput>
<h1>#chapter.name()#</h1>
<s:content id="chapter" text="#chapter.content()#" />
<s:wizard_navigation />
</cfoutput>