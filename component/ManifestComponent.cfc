import config.HTTPRequest;

component
	accessors = true
    displayname = 'ManifestComponent'
    extends = 'config.Component'
{

	property dir;
    property HTTPRequest req;
    property String componentName;

	public ManifestComponent function init(HTTPRequest req)
    {

    	/*
    		definition values to return this object
    	*/
    	setDir('/component');
        setReq(req);

    	return this;
    }

    public config.ManifestConfig function component(String nameComponent)
    {

        setComponentName(nameComponent);

        var routingBundle = {};

        /*
                Manegement controllers of Bundles
        */

         // StructInsert(routingBundle, 'user', getDir() & '/user/');
         // StructInsert(routingBundle, 'model', getDir() & '/model/');

         StructInsert(routingBundle, 'response', getDir() & '/response/');
         StructInsert(routingBundle, 'yaml', getDir() & '/yaml/');

         /*
                return of object created in component
         */
         return CreateObject('component', routingBundle[LCase(nameComponent)] & nameComponent & 'Manifest').init(this);
     }


}

