<cfset setTitle("Download") />

<cfoutput>
<div class="container">
	<h1>What are you waiting for?</h1>
	<p>
		ColdMVC is available to download on <a href="https://github.com/tonynelson19/ColdMVC" target="_blank">GitHub</a>. Go get it while it's hot!
	</p>
	<h2>Latest Commits</h2>
	<dl class="list">
		<c:each in="#commits#" do="commit" class="class">
			<dt<cfif class neq ""> class="#class#"</cfif>><a href="#commit.url#" title="#commit.date#">#commit.date#</a></dt>
			<dd><c:string value="#commit.message#" /></dd>
		</c:each>
	</dl>
</div>
</cfoutput>