<cfoutput>
<c:doctype />
<c:html>
	<c:head>
		<c:style name="http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css" />
		<c:style name="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" />
		<c:style name="style.css" />
		<c:script name="http://html5shim.googlecode.com/svn/trunk/html5.js" />
		<c:script name="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" />
	</c:head>
	<c:body>
		<div class="topbar">
			<div class="container">
				<a class="brand" href="#linkTo('/')#">ColdMVC</a>
				<c:menu maxDepth="1" />
			</div>
		</div>
		<div class="breadcrumbs">
			<div class="container">
				<c:breadcrumbs />
			</div>
		</div>
		<c:render />
		<footer id="footer">
			<div class="container">
				&copy; #year(now())# Tony Nelson
				<c:menu maxDepth="1" />
			</div>
		</footer>
		<google:analytics account="UA-21088677-1" />
	</c:body>
</c:html>
</cfoutput>