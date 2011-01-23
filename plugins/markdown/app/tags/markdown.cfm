<cfif thisTag.executionMode eq "end">

	<cfset thisTag.generatedContent = $.factory.get("markdownProcessor").markdown(thisTag.generatedContent) />

</cfif>