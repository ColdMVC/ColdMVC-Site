<cfif thisTag.executionMode eq "end">

	<c:breadcrumbs result="breadcrumbs">
		<c:breadcrumb text="#attributes.record.name()#" url="#linkTo({controller='#$.event.controller()#', action='#$.event.action()#', id=attributes.record})#" />
	</c:breadcrumbs>

	<cfset $.page.title(attributes.record.name()) />
	<cfset $.page.header(breadcrumbs) />

</cfif>