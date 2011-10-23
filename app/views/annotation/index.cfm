<cfset setTitle("Annotations") />

<cfoutput>
<h1>Annotations</h1>
<dl class="list">
	<c:each in="#annotations#" do="annotation" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#linkTo({action='show', id=annotation})#" title="#annotation.name()#">#annotation.name()#</a></dt>
		<dd>#annotation.description()#</dd>
	</c:each>
</dl>
</cfoutput>

<c:content key="sidebar">
<c:markdown>
### About Annotations

Annotations allow you to add custom metadata to components and methods that can be used to provide additional functionality throughout your application.

For more information on annotations, check out the chapter on [annotations] [1] in the [Reference Guide] [2].

If you have an idea for an annotation that you think might benefit others as part of the framework, let us know by sending an email to <coldmvc@gmail.com>.

[1]: /guide/annotations
[2]: /guide
</c:markdown>
</c:content>