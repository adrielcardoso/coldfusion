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

        var recurseYaml = getContext().getMContainer().getComponent('yaml');
        var file = recurseYaml.load('config');

        // ## define mangement default
        setBundleDefault(getDir() & '/#file.getKey(['mapping', 'bundle_main'])#/');

        var parseStruct = {};
        for(single in (file.getKey(['mapping', 'bundle']))){

            StructInsert(parseStruct, single['alias'], getDir() & '/#single['name']#/');
        }


        return parseStruct;

    }

    public Routing function main(ManifestConfig mContext)
    {

        /* definition thread main */
        setContext(mContext);

        /*
            definition values to return this object
        */
        setDir('/src');


    	/*
			set registrars
    	*/
    	setRoutingBundle(this.bundle());


    	/*
			set bundle in thread main
    	*/
    	setBundleRequestMain(
                (parseExistAliasBundle(mContext.getBindRequest().getStBundle(), routingBundle)
                ? getRoutingBundle()[mContext.getBindRequest().getStBundle()]
                : getBundleDefault())
        );

        /*
            register of manifest bundle
        */
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

