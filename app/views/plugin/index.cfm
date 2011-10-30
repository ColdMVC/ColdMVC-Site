<cfset setTitle("Plugins") />

<cfoutput>
<div class="container">
	<div class="row">
		<div class="span12">
			<h1>Need something extra?</h1>
			<dl class="list">
				<c:each in="#plugins#" do="plugin" class="class">
					<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({action='show', id=plugin})#" title="#plugin.name()#">#plugin.name()#</a></dt>
					<dd>
						<cfif plugin.description() neq "">
							#plugin.description()#
						</cfif>
						<a href="#plugin.url()#" target="_blank">#plugin.url()#</a>
					</dd>
				</c:each>
			</dl>
		</div>
		<div class="span4">
			<h2>About Plugins</h2>
			<p>Plugins are a great way of extending the functionality of the framework without modifying the core files.</a>
			<p>For more information on plugins, check out the <a href="#linkTo('/guide/plugins')#">chapter on plugins</a> in the <a href="#linkTo('/guide')#">Reference Guide</a>.</a>
			<p>If you have any questions about plugins, post a message to the <a href="http://groups.google.com/group/coldmvc" target="_blank">Group</a> or send an email to <a href="mailto:coldmvc@gmail.com">coldmvc@gmail.com</a>.</a>
			<p>If you have a plugin that you'd like to list on the site, <a href="#linkTo('/submit-plugin')#">we'd love to see it</a>.</a>
		</div>
	</div>
</div>
</cfoutput>