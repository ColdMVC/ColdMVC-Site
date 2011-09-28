<cfif thisTag.executionMode eq "end">

<cfif not structKeyExists(attributes, "text")>
	<cfset attributes.text = thisTag.generatedContent />
</cfif>

<cfparam name="attributes.title" default="" />
<cfparam name="attributes.id" default="" />

<cfset attributes.text = trim(attributes.text) />

<cfif attributes.text neq "">

	<cfoutput>
	<cfsavecontent variable="thisTag.generatedContent">
		<div class="#lcase(attributes.title)# content" <cfif attributes.id neq "">id="#attributes.id#"</cfif>>
			<cfif attributes.title neq "">
				<h2>#attributes.title#:</h2>			
			</cfif>
			#attributes.text#
		</div>
	</cfsavecontent>
	</cfoutput>

</cfif>

</cfif>