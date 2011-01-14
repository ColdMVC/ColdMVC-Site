<cfset $.page.title("ColdMVC Discussion") />
<cfset $.page.header("Discussion") />

<cfoutput>
<c:layout>
	<div class="container">
		<div id="content" class="span-18">
			<c:render />
		</div>
		<div id="sidebar" class="span-6 last">
			<div id="sidebar_container">
				<c:include template="discussion/sidebar.cfm" />
			</div>
		</div>
	</div>
</c:layout>
</cfoutput>