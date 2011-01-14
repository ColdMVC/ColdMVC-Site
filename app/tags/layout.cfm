<cfif thisTag.executionMode eq "end">
<cfoutput>
<cfsavecontent variable="thisTag.generatedContent">
	<c:doctype />
	<c:html>
		<head>
			<title>#$.page.title()#</title>
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
					Footer
				</div>
			</div>
		</body>
	</c:html>
</cfsavecontent>
</cfoutput>
</cfif>