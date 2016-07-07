/**
* 
* @Comment 
* 
* Routing.cfc define a restrição na busca de parametros 
* definos da configuração de mapeamento de bundles e componentes.
* 
* Todo novo bundle ou componente deve ser registrado em /config.config.yaml
* 
* uma vez registrado, o framework podera acessar seus recursos.
* 
* */

component
	accessors = true
    displayname = 'Routing'
{
	property struct routingBundle;
	property String dir;
	property String bundleDefault;
	property String bundleRequestMain;
    property ManifestConfig bundleManifest;
    property ManifestConfig context;

    public struct function bundle()
    {

        var recurseYaml = getContext().getComponent('yaml');
        var file = recurseYaml.load('config');

        setBundleDefault(getDir() & '/#file.getKey(['mapping', 'bundle_main'])#/');

        var parseStruct = {};
        for(single in (file.getKey(['mapping', 'bundle']))){

            StructInsert(parseStruct, single['alias'], getDir() & '/#single['name']#/');
        }

        return parseStruct;

    }

    public Routing function main(ManifestConfig mContext)
    {

        setContext(mContext);

        setDir('/src');

    	setRoutingBundle(this.bundle());

    	setBundleRequestMain(
                (parseExistAliasBundle(mContext.getRequest().getStBundle(), routingBundle)
                ? getRoutingBundle()[mContext.getRequest().getStBundle()]
                : getBundleDefault())
        );

        setBundleManifest(this.loadConfigBundle(getBundleRequestMain()));

    	return this;
    }

    public boolean function parseExistAliasBundle(String name, struct bundles)
    {
    	return StructKeyExists(bundles, name);
    }

    public ManifestConfig function loadConfigBundle(String bundleName)
    {
        return createObject("component", bundleName & '/BundleManifest').init(bundleName);
    }

}

