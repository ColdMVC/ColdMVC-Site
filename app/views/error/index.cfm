<cfset setTitle("Error") />

<cfoutput>
<div class="container">
	<h1>#error.message#</h1>
	<p>#error.detail#</p>
</div>
</cfoutput>