<cfif thisTag.executionMode eq "end">
	<cfparam name="attributes.text" default="" />
	<cfparam name="attributes.url" default="" />
	<cfassociate basetag="cf_breadcrumbs" />
</cfif>