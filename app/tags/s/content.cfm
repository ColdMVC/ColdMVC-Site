<cfif thisTag.executionMode eq "end">

	<cfif not structKeyExists(attributes, "text")>
		<cfset attributes.text = thisTag.generatedContent />
	</cfif>

	<cfparam name="attributes.title" default="" />

	<cfset attributes.text = trim(attributes.text) />

	<cfif attributes.text neq "">

		<cfoutput>
		<cfsavecontent variable="thisTag.generatedContent">
			<div class="content">
				<cfif attributes.title neq "">
					<h4>#attributes.title#:</h4>
				</cfif>
				#attributes.text#
			</div>
		</cfsavecontent>
		</cfoutput>

	</cfif>

</cfif>