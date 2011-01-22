<cfif thisTag.executionMode eq "end">

<cfif attributes.text neq "">

<cfoutput>
<div class="#lcase(attributes.title)# content">
	<h2>#attributes.title#:</h2>
	#attributes.text#
</div>
</cfoutput>

</cfif>

</cfif>