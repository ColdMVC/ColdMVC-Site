<cfoutput>
<h1>Helpers</h1>
<dl class="list">
	<c:each in="#helpers#" do="helper" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({action='show', id=helper})#" title="#helper.name()#">#helper.name()#</a></dt>
		<dd>#helper.description()#</dd>
	</c:each>
</dl>
</cfoutput>

<c:content key="sidebar">
<c:markdown>
### About Helpers

Helpers are utility classes that can be used to perform common operations throughout your application.

For more information on helpers, check out the [chapter on helpers] [1] in the [Reference Guide] [2].

If you have an idea for a helper that you think would be great for ColdMVC, let us know by sending an email to <coldmvc@gmail.com>.

[1]: /guide/helpers "Helpers"
[2]: /guide "Reference Guide"
</c:markdown>
</c:content>