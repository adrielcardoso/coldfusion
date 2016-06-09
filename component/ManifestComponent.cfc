import app.HTTPRequest;

component
	accessors = true
    displayname = 'ManifestComponent'
    extends = 'app.Component'
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

    public app.ManifestConfig function component(String nameComponent)
    {

         setComponentName(nameComponent);

         routingBundle = loadComponentYaml('config', ['mapping', 'component']);

         return CreateObject('component', routingBundle[LCase(nameComponent)] & nameComponent & 'Manifest').init(this);

     }

     public any function loadComponentYaml(required String fileName, required array key)
     {

        var yaml = CreateObject('component', getDir() & '/yaml/YamlManifest').init(this);

        var components = yaml.load(fileName).getKey(key);

        var parseStruct = {};
        for(single in components){

            StructInsert(parseStruct, single['alias'], getDir() & '/#single['name']#/');
        }

        return parseStruct;

     }


}

