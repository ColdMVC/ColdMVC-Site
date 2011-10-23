<cfset setTitle("Discussion") />

<c:markdown>
# Got a question?

If you have any questions, ideas, suggestions, or comments about ColdMVC, please join the discussion at our [Google Groups] [1] page.

If public forums aren't your thing, then feel free to send an email to <coldmvc@gmail.com> and we'll respond as soon as possible.

And of course we're on [Twitter] [2], so you can always send a tweet to [@ColdMVC] [3].

[1]: http://groups.google.com/group/coldmvc "ColdMVC | Google Groups"
[2]: http://twitter.com/ "Twitter"
[3]: http://twitter.com/ColdMVC "@ColdMVC"
</c:markdown>

<cfoutput>
<cfif arrayLen(messages) gt 0>
	<c:content key="sidebar">
		<h3>Recent Discussions</h3>
		<ul id="recent_discussions">
			<c:each in="#messages#" do="message" max="3">
				<li><a href="#message.url#" title="#message.title#">#message.title#</a></li>
			</c:each>
		</ul>
	</c:content>
</cfif>
</cfoutput>
