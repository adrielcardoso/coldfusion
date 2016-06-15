component
	output="false"
	hint="Aplicaçãp de teste para criação MVC Cold Fusion"
{

	// property baseDirectory;
	this.baseDirectory = getDirectoryFromPath(getCurrentTemplatePath());

	// this.name = hash(this.baseDirectory);
	this.name = hash(getTickCount());
	this.applicationTimeout = createTimeSpan(0,1,0,0);
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,10,0);

	this.mappings[ "/src" ] = (this.baseDirectory & "src/");
	this.mappings[ "/app" ] = (this.baseDirectory & "app/");
	this.mappings[ "/config" ] = (this.baseDirectory & "config/");
	this.mappings[ "/component" ] = (this.baseDirectory & "component/");

	// this.mappings[ "/view" ] = (this.baseDirectory & "src/CFUserBundle/view/");
	// this.mappings[ "/controller" ] = (this.baseDirectory & "src/CFUserBundle/controller");

	this.ormenabled = false;
	this.datasource	= "devdsn";

	function onApplicationStart()
	{
		// application.factory = CreateObject( "component", "config.factory" ).init();
		application.basedir = 'http://' & CGI.HTTP_HOST & replaceNoCase(cgi.SCRIPT_NAME, listLast(cgi.SCRIPT_NAME, "/"), "");
		application.language = 'ptBr';

		return true;
	}

	function onSessionStart(){}

	function onRequestStart(String scriptName)
	{
		request.tempo = getTickCount();

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
		return true ;
	}

	function onRequest( String scriptName )
	{
		request.tempo = getTickCount() - request.tempo;

		include "./index.cfm";
	}

	function onError(Any error, String eventName)
	{
		writeDump( error );
		abort;
	}

	function onMissingTemplate(String targetPage)
	{
		writeDump('okok');
		writeDump( targetPage );
		abort;
	}

}