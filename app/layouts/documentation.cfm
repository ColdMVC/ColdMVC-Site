<cfoutput>
<c:layout>
	<div class="container">
		<div id="content" class="span-18">
			<c:render />
		</div>
		<div id="sidebar" class="span-6 last">
			<div id="sidebar_container">
				<cfloop from="1" to="3" index="i">
					<c:lorem_ipsum what="words" amount="20" /><br />
				</cfloop>
			</div>
		</div>
	</div>
</c:layout>
</cfoutput>