<cfoutput>
<c:doctype />
<c:html>
	<c:head>
		<c:style name="blueprint/reset.css" media="screen, projection" />
		<c:style name="blueprint/grid.css" media="screen, projection" />
		<c:style name="blueprint/print.css" media="print" />
		<c:style name="blueprint/ie.css" media="screen, projection" condition="lt IE 8" />
		<c:style name="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" />
		<c:style name="style.css" />
		<c:script name="jquery-1.4.4.min.js" />
		<c:script name="application.js" />
	</c:head>
	<c:body>
		<div id="top">
			<div class="container">
				<div id="logo"><a href="#linkTo('/')#">ColdMVC</a></div>
				<div id="tabs">
					<c:menu maxDepth="1" />
				</div>
			</div>
		</div>
		<div id="header">
			<div class="container">
				<c:breadcrumbs />
			</div>
		</div>
		<div class="container">
			<cfif hasContent("sidebar")>
				<div id="content" class="span-18">
					<c:flash />
					<c:render />
				</div>
				<div id="sidebar" class="span-6 last">
					<div id="sidebar_container">
						<c:render key="sidebar" />
					</div>
				</div>
			<cfelse>
				<div id="content" class="no-sidebar">
					<c:flash />
					<c:render />
				</div>
			</cfif>
		</div>
		<div id="footer">
			<div class="container">
				&copy; #year(now())# Tony Nelson
				<c:menu maxDepth="1" />
			</div>
		</div>
		<cfif not isDevelopment()>
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
	</c:body>
</c:html>
</cfoutput>