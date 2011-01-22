<cfoutput>
<cfif arrayLen(messages) gt 0>
	<h3>Recent Discussions</h3>
	<ul id="recent_discussions">
		<c:each in="#messages#" do="message" max="3">
			<li><a href="#message.url#" title="#message.title#">#message.title#</a></li>
		</c:each>
	</ul>
</cfif>
</cfoutput>