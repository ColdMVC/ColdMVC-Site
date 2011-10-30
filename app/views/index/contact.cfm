<cfset setTitle("Contact") />

<cfoutput>
<div class="container">
	<div class="row">
		<div class="span12">
			<h1>Want to get ahold of somebody?</h1>
			<p>If you have any questions, ideas, suggestions, or comments about ColdMVC, feel free to join the discussion at our <a href="http://groups.google.com/group/coldmvc" target="_blank">Google Groups</a> page.</p>
			<p>If public forums aren't your thing, then feel free to send an email to <a href="mailto:coldmvc@gmail.com">coldmvc@gmail.com</a> and I'll respond as soon as possible.</p>
			<p>And of course we're on Twitter, so you can always send a tweet to  <a href="http://twitter.com/coldmvc" target="_blank">@ColdMVC</a>.</p>
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