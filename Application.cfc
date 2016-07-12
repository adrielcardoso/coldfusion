component
	output="false"
	hint="Aplicação de teste para criação MVC Coldfusion"
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
	this.mappings[ "/web" ] = (this.baseDirectory & "web/");
	
	// writeDump(getDirectoryFromPath( getCurrentTemplatePath() ) & 'testbox/');

	// abort;
	// this.mappings[ "/src/CFUserBundle/entity" ] = (this.baseDirectory & "src/CFUserBundle/entity/");

	// this.mappings[ "/view" ] = (this.baseDirectory & "src/CFUserBundle/view/");
	// this.mappings[ "/controller" ] = (this.baseDirectory & "src/CFUserBundle/controller");


	// definition to ORM hibernate

	this.ormEnabled = true;
	this.datasource	= "oracle";
	this.ormsettings.cfclocation = "src";
	// this.ormsettings.dialect = "MySQLwithInnoDB";
	this.ormSettings.logSQL = true;

	//if this is a development server...
    this.developmentServer = true;

    if(this.developmentServer){

		// hibernate remove tables
		// session.user_session = '';
      	// this.ormsettings.dbcreate = "dropcreate";
      	// this.ormsettings.logSQL = true;
    }


	function onApplicationStart()
	{
		// application.factory = CreateObject( "component", "config.factory" ).init();
		application.basedir = 'http://' & CGI.HTTP_HOST & replaceNoCase(cgi.SCRIPT_NAME, listLast(cgi.SCRIPT_NAME, "/"), "");
		application.language = 'ptbr';

		return true;
	}

	function onSessionStart(){}

	function onRequestStart(String scriptName)
	{
		// request.tempo = getTickCount();

		// if (structKeyExists( url, "init" )){
		// 	this.onApplicationStart();
		// 	this.onSessionStart();
		// }

		// request.event = [];
		// if (
		// 	!isNull( url.event ) &&
		// 	len( trim( url.event ) )
		// 	){

		// 	request.event = listToArray( trim( url.event ), "." );
		// }

		ORMReload();

		// request.viewData = {};
		return true ;
	}

	function onRequest( String scriptName )
	{
		// request.tempo = getTickCount() - request.tempo;

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