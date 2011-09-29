<s:valid_page record="#helper#" />

<cfoutput>
<h1>#helper.name()#</h1>
<s:content title="Description" text="#helper.description()#" />
<s:content title="Overview" text="#helper.overview()#" />
<s:content title="Parameters" text="#helper.parameters()#" />
<s:content title="Example" text="#helper.example()#" />
<s:content title="URL">
	<a href="#helper.url()#" title="#helper.url()#" target="_blank">#helper.url()#</a>
</s:content>

<c:content key="sidebar">
	<h3>Browse Helpers</h3>
	<ul>
		<c:each in="#helpers#" do="helper">
			<li><a href="#linkTo({action='show', id=helper})#" title="#helper.name()#">#helper.name()#</a></li>
		</c:each>
	</ul>
</c:content>
</cfoutput>