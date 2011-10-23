<cfset setTitle("Custom Tags") />

<cfoutput>
<h1>Custom Tags</h1>
<dl class="list">
	<c:each in="#tags#" do="tag" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({action='show', id=tag})#" title="#tag.name()#">#tag.name()#</a></dt>
		<dd>#tag.description()#</dd>
	</c:each>
</dl>
</cfoutput>

<c:content key="sidebar">
<c:markdown>
### About Tags

Tags provide a clean way of encapsulating reusable presentation code.

For more information on tags, check out the [chapter on tags] [1] in the [Reference Guide] [2].

If you have a tag that you think should be included in the core framework, let us know by sending an email to <coldmvc@gmail.com>.

[1]: /guide/tags
[2]: /guide
</c:markdown>
</c:content>