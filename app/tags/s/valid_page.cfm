<cfif thisTag.executionMode eq "end">

	<c:title value="#attributes.record.name()#" />
	<c:content name="header">
		<c:breadcrumbs>
			<c:breadcrumb text="#attributes.record.name()#" url="#linkTo({controller='#$.event.controller()#', action='#$.event.action()#', id=attributes.record})#" />
		</c:breadcrumbs>
	</c:content>

</cfif>