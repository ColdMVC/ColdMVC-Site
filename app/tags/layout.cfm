<cfif thisTag.executionMode eq "start">

	<c:breadcrumbs result="breadcrumbs" />
	<cfset tab = $.factory.get("tabManager").getTab() />

	<cfif tab neq "" and tab neq "Home">
		<cfset title = "ColdMVC " & tab />
	<cfelse>
		<cfset title = "ColdMVC" />
	</cfif>

	<cfset $.page.addTitle(title) />
	<cfset $.page.setContent("header", breadcrumbs) />

<cfelse>

<cfoutput>
<cfsavecontent variable="thisTag.generatedContent">
	<c:doctype />
	<c:html>
		<head>
			<c:version />
			<c:title />
			<c:content_type />
			<c:charset />
			<c:viewport />
			<meta name="keywords" content="ColdMVC, ColdFusion, MVC, framework, open-source" />
			<meta name="description" content="ColdMVC is a convention-based framework for ColdFusion" />
			<meta name="author" content="Tony Nelson" />
			<c:favicon />
			<c:style name="blueprint/reset.css" media="screen, projection" />
			<c:style name="blueprint/grid.css" media="screen, projection" />
			<c:style name="blueprint/print.css" media="print" />
			<c:style name="blueprint/ie.css" media="screen, projection" condition="lt IE 8" />
			<link href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" rel="stylesheet" type="text/css" />
			<c:style name="style.css" />
			<c:script name="jquery-1.4.4.min.js" />
			<c:script name="application.js" />
		</head>
		<body>
			<div id="top">
				<div class="container">
					<div id="logo"><a href="#linkTo('/')#">ColdMVC</a></div>
					<div id="tabs">
						<c:tabs />
					</div>
				</div>
			</div>
			<div id="header">
				<div class="container">
					<c:render name="header" />
				</div>
			</div>
			<div class="container">
				#thisTag.generatedContent#
			</div>
			<div id="footer">
				<div class="container">
					&copy; #year(now())# Tony Nelson
					<c:tabs />
				</div>
			</div>
			<cfif not $.config.get("development")>
				<script type="text/javascript">
					var _gaq = _gaq || [];
					_gaq.push(['_setAccount', 'UA-21088677-1']);
					_gaq.push(['_trackPageview']);
					(function() {
						var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
						ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
						var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
					})();
				</script>
			</cfif>
		</body>
	</c:html>
</cfsavecontent>
</cfoutput>
</cfif>