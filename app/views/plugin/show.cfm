<cfset setTitle(plugin.name() & " Plugin") />
<cfset addBreadcrumb(linkTo("plugin", {id=plugin}), plugin.name()) />

<cfoutput>
<div class="container">
	<div class="row">
		<div class="span12">
			<form>
				<h1>#plugin.name()# Plugin</h1>
				<c:text name="author" value="#plugin.author()#" />
				<c:text name="url" label="URL">
					<a href="#plugin.url()#" target="_blank">#plugin.url()#</a>
				</c:text>
				<c:text name="description" value="#plugin.description()#" escape="false" />
				<cfif plugin.overview() neq "">
					<c:text name="overview" value="#plugin.overview()#" />
				</cfif>
				<cfif plugin.example() neq "">
					<c:text name="example" value="#plugin.example()#" />
				</cfif>
			</form>
		</div>
		<div class="span4">
			<h2>Browse Plugins</h2>
			<ul>
				<c:each in="#plugins#" do="plugin">
					<li><a href="#linkTo({action='show', id=plugin})#" title="#plugin.name()#">#plugin.name()#</a></li>
				</c:each>
			</ul>
		</div>
	</div>
</div>
</cfoutput>