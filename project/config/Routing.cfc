component
	accessors = true
    displayname = 'Routing'
{
	property struct routingBundle;
	property String dir;
	property String bundleDefault;
	property String bundleRequestMain;

    public Routing function main(HTTPRequest bindRequest)
    {

    	/*
    		definition values to return this object
    	*/
    	setDir('/src'); 
    	setBundleDefault(getDir() & '/CFSiteBundle/');


    	var routingBundle = {};

    	/* 
				Manegement controller of Bundle
    	*/
         StructInsert(routingBundle, 'main', getDir() & '/CFSiteBundle/'); 
         StructInsert(routingBundle, 'user', getDir() & '/CFUserBundle/'); 

    	/*
			set registrars
    	*/
    	setRoutingBundle(routingBundle);


    	/*
			set bundle in thread main
    	*/
    	setBundleRequestMain(
                (parseExistAliasBundle(bindRequest.getStBundle(), routingBundle) 
                ? getRoutingBundle()[bindRequest.getStBundle()] 
                : getBundleDefault())
        );

    	return this;
    }

    public boolean function parseExistAliasBundle(String name, struct bundles)
    {
    	return StructKeyExists(bundles, name);
    }

} 

