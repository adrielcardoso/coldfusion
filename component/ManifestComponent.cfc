component
	accessors = true
    displayname = 'ManifestComponent'
    extends = 'config.ManifestConfig'
{

	property dir;

	public ManifestComponent function init()
    {

    	/*
    		definition values to return this object
    	*/
    	setDir('/component');

    	return this;
    }

    public config.ManifestConfig function component(String nameComponent)
    {

        var routingBundle = {};

        /*
                Manegement controllers of Bundles
        */
         StructInsert(routingBundle, 'user', getDir() & '/user/');
         StructInsert(routingBundle, 'model', getDir() & '/model/');


         return CreateObject('component', routingBundle[LCase(nameComponent)] & nameComponent & 'Manifest');
     }


}

