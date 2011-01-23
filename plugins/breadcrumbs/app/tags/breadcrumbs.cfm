<cfif thisTag.executionMode eq "end">

	<cfparam name="attributes.delimiter" default=">" />
	<cfparam name="attributes.id" default="" />
	<cfparam name="attributes.class" default="breadcrumbs" />

	<cfset attrs = coldmvc.struct.toAttributes({
		id = attributes.id,
		class = attributes.class
	}) />

	<cfset breadcrumbs = coldmvc.factory.get("breadcrumbManager").getBreadcrumbs($.event.controller(), $.event.action()) />

	<cfif structKeyExists(thisTag, "assocAttribs")>

		<cfloop from="1" to="#arrayLen(thisTag.assocAttribs)#" index="i">

			<cfset breadcrumb = {
				text = htmlEditFormat(thisTag.assocAttribs[i].text),
				url = thisTag.assocAttribs[i].url
			} />

			<cfset arrayAppend(breadcrumbs, breadcrumb) />

		</cfloop>

	</cfif>

	<cfoutput>
	<cfsavecontent variable="thisTag.generatedContent">
		<ul<cfif attrs neq ""> #attrs#</cfif>>
			<c:each in="#breadcrumbs#" do="breadcrumb" index="i" class="class">
				<cfif i gt 1>
					<li class="delimiter">#attributes.delimiter#</li>
				</cfif>
				<li<cfif class neq ""> class="#class#"</cfif>><cfif breadcrumb.url neq ""><a href="#breadcrumb.url#" title="#breadcrumb.text#">#breadcrumb.text#</a><cfelse>#breadcrumb.text#</cfif></li>
			</c:each>
		</ul>
	</cfsavecontent>
	</cfoutput>

	<cfset thisTag.generatedContent = trim(thisTag.generatedContent) />

	<cfif structKeyExists(attributes, "result")>
		<cfset caller[attributes.result] = thisTag.generatedContent />
		<cfset thisTag.generatedContent = "" />
	</cfif>

</cfif>