<cfif thisTag.executionMode eq "start">

	<c:breadcrumbs result="breadcrumbs" />
	<cfset page = $.factory.get("tabManager").getTab() />

	<cfset $.page.title(page) />
	<cfset $.page.header(breadcrumbs) />

<cfelse>

<cfset title = $.page.title() />
<cfset suffix = " | A Convention-Based MVC Framework for ColdFusion" />

<cfif title neq "" and title neq "Home">
	<cfset title = "ColdMVC " & title & suffix />
<cfelse>
	<cfset title = "ColdMVC" & suffix />
</cfif>

<cfoutput>
<cfsavecontent variable="thisTag.generatedContent">
	<c:doctype />
	<c:html>
		<head>
			<title>#title# </title>
			<c:content_type />
			<meta name="keywords" content="ColdMVC, ColdFusion, framework, open-source" />
			<meta name="description" content="ColdMVC is a convention-based framework for ColdFusion" />
			<c:favicon />
			<c:style name="blueprint/reset.css" media="screen, projection" />
			<c:style name="blueprint/grid.css" media="screen, projection" />
			<c:style name="blueprint/print.css" media="print" />
			<c:style name="blueprint/ie.css" media="screen, projection" condition="lt IE 8" />
			<link href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" rel="stylesheet" type="text/css" />
			<c:style name="style.css" />
			<c:script name="jquery-1.4.4.min.js" />
			<c:script name="application.js" />
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
					#$.page.header()#
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
		</body>
	</c:html>
</cfsavecontent>
</cfoutput>
</cfif>