<cfcomponent output="false">

	<cffunction name="init" access="public" output="false" returntype="query">
		<cfargument name="source" required="true" type="string" />

		<cffeed source="#arguments.source#" userAgent="Mozilla/5.0" query="local.content" />

		<cfreturn local.content />

	</cffunction>

</cfcomponent>