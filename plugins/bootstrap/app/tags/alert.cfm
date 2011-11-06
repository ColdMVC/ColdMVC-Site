<cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.type" default="error" />

	<cfif not structKeyExists(attributes, "message")>

		<cfset attributes.message = thisTag.generatedContent />

		<cfif not structKeyExists(attributes, "escape")>
			<cfset attributes.escape = false />
		</cfif>

	</cfif>

	<cfif not structKeyExists(attributes, "escape")>
		<cfset attributes.escape = true />
	</cfif>

	<cfset attributes.message = trim(attributes.message) />

	<cfif attributes.message neq "">

		<cfif attributes.escape>
			<cfset content = "<p>" & escape(attributes.message) & "</p>" />
		<cfelse>
			<cfset content = attributes.message />
		</cfif>

		<cfoutput>
		<cfsavecontent variable="thisTag.generatedContent">
			<div class="alert-message #attributes.type#">
				<cfif $.factory.getBean("twitterBootstrap").getScript("alerts")>
					<a class="close" href="##">x</a>
				</cfif>
				<p>#content#</p>
			</div
		</cfsavecontent>
		</cfoutput>

	</cfif>

</cfif>