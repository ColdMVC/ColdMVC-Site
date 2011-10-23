<cfset setTitle(chapter.name()) />
<cfset addBreadcrumb(linkTo({id=chapter}), chapter.name()) />

<cfoutput>
<h1>#chapter.name()#</h1>
<s:content id="chapter" text="#chapter.content()#" />
<s:wizard_navigation />
</cfoutput>