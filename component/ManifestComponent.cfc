import app.ManifestConfig;

/**
* @Comment 
* 
* Para controlar acessos a todos os componentes esse ManifestComponent, serve como interface para
* acesso a qualquer componente ja mapeado no /config/config.yaml
* 
* */

component
	accessors = true
    displayname = 'ManifestComponent'
    extends = 'app.Component'
{

    property Any mContext;
    property String componentName;

	public Any function init(Any mContext)
    {
        setDir('/component');

        setMContext(mContext);

    	return this;
    }

    public app.ManifestConfig function component(String nameComponent)
    {
         setComponentName(nameComponent);

         routingBundle = loadComponentYaml('config', ['mapping', 'component']);

         return CreateObject('component', routingBundle[LCase(nameComponent)]['dir'] &
                            parseNameDir(routingBundle[LCase(nameComponent)]['name']) & 'Manifest').init(this);
    }

    public any function loadComponentYaml(required String fileName, required array key)
    {
        var componentName = getComponentName();

        setComponentName('Yaml');

        var yaml = CreateObject('component', getDir() & '/yaml/YamlManifest').init(this);

        var components = yaml.load(fileName).getKey(key);

        var parseStruct = {};
        for(single in components){

            StructInsert(parseStruct, single['alias'], {
                'dir' : getDir() & '/#single['name']#/',
                'name' : single['name']
            });
        }

        setComponentName(componentName);

        return parseStruct;
    }

}

