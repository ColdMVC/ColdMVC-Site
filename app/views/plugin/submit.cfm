<cfset setTitle("Submit a Plugin") />

<cfoutput>
<div class="container">
	<h1>Submit a Plugin</h1>
	<c:errors />
	#pluginForm.render()#
</div>
</cfoutput>