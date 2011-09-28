<cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.what" default="paras" />
	<cfparam name="attributes.amount" default="1" />

	<cfset string = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." />

	<cfswitch expression="#attributes.what#">

		<cfcase value="paras">

			<cfset result = [] />

			<cfloop from="1" to="#attributes.amount#" index="i">
				<cfset arrayAppend(result, "<p>#string#</p>") />
			</cfloop>

			<cfset result = arrayToList(result, chr(13)) />

		</cfcase>

		<cfcase value="words">

			<cfset result = [] />
			<cfset array = listToArray(string, " ") />

			<cfloop from="1" to="#attributes.amount#" index="i">
				<cfset arrayAppend(result, array[i]) />
			</cfloop>

			<cfset result = arrayToList(result, " ") />

			<cfif right(result, 1) eq ",">
				<cfset result = left(result, len(result) - 1) />
			</cfif>

			<cfif right(result, 1) neq ".">
				<cfset result = result & "." />
			</cfif>

			<cfset result = "<p>#result#</p>" />

		</cfcase>

	</cfswitch>

	<cfset thisTag.generatedContent = result />

</cfif>