<cfif thisTag.executionMode eq "end">

<cfif not structKeyExists(attributes, "text")>
	<cfset attributes.text = thisTag.generatedContent />
</cfif>

<cfif attributes.text neq "">

	<cfoutput>
	<cfsavecontent variable="thisTag.generatedContent">
		<div class="#lcase(attributes.title)# content">
			<h2>#attributes.title#:</h2>
			#attributes.text#
		</div>
	</cfsavecontent>
	</cfoutput>

</cfif>

</cfif>