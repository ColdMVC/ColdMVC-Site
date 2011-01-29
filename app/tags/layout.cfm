<cfif thisTag.executionMode eq "start">

	<c:breadcrumbs result="breadcrumbs" />
	<cfset page = $.factory.get("tabManager").getTab() />

	<cfset $.page.title(page) />
	<cfset $.page.header(breadcrumbs) />

<cfelse>

<cfset title = $.page.title() />
<cfset suffix = "ColdMVC | A Convention-Based MVC Framework for ColdFusion" />

<cfif title neq "" and title neq "Home">
	<cfset title = title & " - " & suffix />
<cfelse>
	<cfset title = suffix />
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
					#$.page.header()#
				</div>
			</div>
			#thisTag.generatedContent#
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