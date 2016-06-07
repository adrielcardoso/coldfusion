component
	accessors = true
    displayname = 'Routing'
{
	property struct routingBundle;
	property String dir;
	property String bundleDefault;
	property String bundleRequestMain;
    property ManifestConfig bundleManifest;


    public Routing function main(HTTPRequest bindRequest)
    {

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
                (parseExistAliasBundle(bindRequest.getStBundle(), routingBundle) 
                ? getRoutingBundle()[bindRequest.getStBundle()] 
                : getBundleDefault())
        );

        /*  
            register of manifest bundle 
        */
        setBundleManifest(this.loadConfigBundle(getBundleRequestMain()));

    	return this;
    }

    public struct function bundle()
    {

        /*
            this is registre of main bundle
        */
        setBundleDefault(getDir() & '/CFSiteBundle/');

        var routingBundle = {};

        /* 
                Manegement controllers of Bundles
        */
         StructInsert(routingBundle, 'main', getDir() & '/CFSiteBundle/'); 
         StructInsert(routingBundle, 'user', getDir() & '/CFUserBundle/'); 

         return routingBundle;
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

