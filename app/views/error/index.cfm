<cfset setTitle("Error") />

<cfoutput>
<div class="container">
	<h1>#error.message#</h1>

	#error.detail#
</div>
</cfoutput>