<cfset setTitle("Contact") />

<cfoutput>
<div class="container">
	<div class="row">
		<div class="span12">
			<h1>Got a question?</h1>
			<p>If you have any questions, ideas, suggestions, or comments about ColdMVC, feel free to join the discussion at our <a href="http://groups.google.com/group/coldmvc" target="_blank">Google Groups</a> page.</p>
			<p>If public forums aren't your thing, then feel free to send an email to <a href="mailto:coldmvc@gmail.com">coldmvc@gmail.com</a> or send a tweet to <a href="http://twitter.com/coldmvc" target="_blank">@ColdMVC</a> and I'll respond as soon as possible.</p>
		</div>
		<div class="span4">
			<h2>Recent Discussions</h2>
			<ul>
				<c:each in="#messages#" do="message">
					<li><a href="#message.url#" title="#message.title#">#message.title#</a></li>
				</c:each>
			</ul>
		</div>
	</div>
</div>
</cfoutput>