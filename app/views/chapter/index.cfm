<cfoutput>
<h1>Reference Guide</h1>
<dl class="list">
	<c:each in="#chapters#" do="chapter" class="class" index="i">
		<dt<cfif class neq ""> class="#class#"</cfif>>Chapter #i#: <a href="#linkTo({controller='chapter', action='show', id=chapter})#" title="#chapter.name()#">#chapter.name()#</a></dt>
		<dd>#chapter.description()#</dd>
	</c:each>
</dl>
</cfoutput>