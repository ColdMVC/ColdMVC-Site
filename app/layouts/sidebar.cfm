<s:layout>
	<div id="content" class="span-18">
		<c:render />
	</div>
	<div id="sidebar" class="span-6 last">
		<div id="sidebar_container">
			<cfloop array="#sidebars#" index="sidebar">
				<c:include template="#sidebar#" />
			</cfloop>
		</div>
	</div>
</s:layout>