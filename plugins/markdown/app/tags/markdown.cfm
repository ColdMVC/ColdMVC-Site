<cfif thisTag.executionMode eq "end">
	<cfset thisTag.generatedContent = coldmvc.factory.getBean("markdownProcessor").markdown(thisTag.generatedContent) />
</cfif>