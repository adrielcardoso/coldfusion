component 
	output="false"
	hint="Aplicaçãp de teste para criação MVC Cold Fusion"
	{

	this.baseDirectory = getDirectoryFromPath(getCurrentTemplatePath());
	this.name = hash(this.baseDirectory);
	this.applicationTimeout = createTimeSpan(0,1,0,0);
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,10,0);

	this.mappings[ "/src" ] = (this.baseDirectory & "src/");
	this.mappings[ "/config" ] = (this.baseDirectory & "config/");
	
	
	function onApplicationStart()
	{
		return( true );
	}
	
	function onSessionStart(){}
	
	function onRequestStart(String scriptName)
	{

		if (structKeyExists( url, "init" )){
			this.onApplicationStart();
			this.onSessionStart();
		}

		request.event = [];
		if (
			!isNull( url.event ) &&
			len( trim( url.event ) )
			){

			request.event = listToArray( trim( url.event ), "." );
		}

		request.viewData = {};
		return( true );
	}
	
	function onRequest( String scriptName )
	{
		include "./index.cfm";		
	}
	
	function onError(Any error, String eventName)
	{
		writeDump( error );
		abort;
	}

}

 
