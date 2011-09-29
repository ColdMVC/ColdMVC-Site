<cfoutput>
<h1>New Plugin Submission</h1>
<c:text name="authorName" value="#yourName#" />
<c:text name="authorEmail" value="#yourEmail#" />
<c:text name="pluginName" value="#pluginName#" />
<c:text name="pluginURL" label="Plugin URL">
	<a href="#pluginURL#">#pluginURL#</a>
</c:text>
<c:text name="description" value="#description#" />
</cfoutput>