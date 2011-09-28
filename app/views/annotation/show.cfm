<s:valid_page record="#annotation#" />

<cfoutput>
<h1>#annotation.name()#</h1>
<s:content title="Description" text="#annotation.description()#" />
<s:content title="Overview" text="#annotation.overview()#" />
<s:content title="Example" text="#annotation.example()#" />
</cfoutput>