<c:markdown>
# What are you waiting for?

ColdMVC is available to download on [GitHub] [1]. Go get it while it's hot!

[1]: https://github.com/tonynelson19/ColdMVC  "tonynelson19/ColdMVC - GitHub"
</c:markdown>

<cfoutput>
<h2>Latest Commits</h2>
<dl class="list">
	<c:each in="#commits#" do="commit" class="class">
		<dt<cfif class neq ""> class="#class#"</cfif>><a href="#commit.url#" title="#commit.date#">#commit.date#</a></dt>
		<dd><c:string value="#commit.message#" /></dd>
	</c:each>
</dl>
</cfoutput>