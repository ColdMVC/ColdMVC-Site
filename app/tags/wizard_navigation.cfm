<cfif thisTag.executionMode eq "end">

	<cfoutput>
	<div class="wizard_navigation">

		<cfloop list="previous,next" index="i">

			<cfif not structKeyExists(attributes, i)>
				<cfset attributes[i] = caller[i] />
			</cfif>

			<cfif not isSimpleValue(attributes[i])>

				<cfif not structKeyExists(attributes, "#i#_url")>
					<cfset attributes["#i#_url"] = linkTo({id=attributes[i]}) />
				</cfif>

				<cfif not structKeyExists(attributes, "#i#_text")>
					<cfset attributes["#i#_text"] = htmlEditFormat(attributes[i].name()) />
				</cfif>

				<div class="wizard_#lcase(i)#">
					<a href="#attributes['#i#_url']#" title="#attributes['#i#_text']#"><cfif i eq "previous">&laquo; </cfif>#attributes['#i#_text']#<cfif i eq "next"> &raquo;</cfif></a>
				</div>
			<cfelse>
				<div class="wizard_#i#"></div>
			</cfif>

		</cfloop>

	</div>
	</cfoutput>

</cfif>