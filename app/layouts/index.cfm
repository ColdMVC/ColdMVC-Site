<cfset $.page.title("ColdMVC") />
<cfset $.page.header("A Convention Based Framework for ColdFusion") />

<cfoutput>
<c:layout>
	<div class="container">
		<div id="content">
			<c:render />
		</div>
	</div>
</c:layout>
</cfoutput>