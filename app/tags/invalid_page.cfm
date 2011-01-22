<cfif thisTag.executionMode eq "end">

	<c:breadcrumbs result="breadcrumbs">
		<c:breadcrumb text="Invalid #attributes.text#" />
	</c:breadcrumbs>

	<cfset $.page.title("Invalid #attributes.text#") />
	<cfset $.page.header(breadcrumbs) />

</cfif>