import component.ManifestComponent;

component
	accessors = true
    displayname = 'YamlManifest'
    extends = 'config.Component'
{

	property ManifestComponent context;

	public config.ManifestConfig function init(ManifestComponent context)
	{
		/*
			set it request of will get containers
		*/
		setContext(context);

		return this;
	}

	public void function parseFile()
	{

		var container = getContainer(this);

		var controller = container.getController('yaml').init(expandPath( '/component/yaml/lib/lib/jyaml-1.3.jar' ));

		var obj = controller.load( expandPath('/config/config.yaml'));

// <cfset obj = o.load( expandPath( 'test.yaml' ) ) />

// <cfdump var="#obj#" label="Yaml to Object">

// <cfset d = o.dump( obj ) />

// <cfset fileWrite( expandPath( 'Test2.yaml' ), d ) />

// <cfdump var="#d#" label="Object To Yaml">


// <cfset obj = o.load( expandPath( 'test2.yaml' ) ) />

// <cfdump var="#obj#" label="Test 2">



		writeDump(obj);

		abort;

		// var o = createObject('component','/component/yaml/lib/Yaml').init( expandPath( '/component/yaml/lib/lib/jyaml-1.3.jar' ) );

	}

}

