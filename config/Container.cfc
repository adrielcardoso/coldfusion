component
	accessors = true
    displayname = 'Container'
{

	property struct memoryBundle;
	property HTTPRequest request;
	property String streamBundleName;
	property Routing routing;

	public Container function parseContainer(HTTPRequest req)
	{

		/*
			set registre of bundles to find services
		*/

		setRouting(CreateObject('component', 'config.Routing').main(req));
		setStreamBundleName(false);

		return this;
	}

	public Container function getBundle(String bundleName = false)
	{

		setStreamBundleName(bundleName);

		return this;
	}

	public Service function getService(String serviceName, String label = 'service')
	{
		/*

				aguardando controller de factory

		*/
		// return new src.CFSiteBundle.service.UserService();
		return CreateObject("component",  (

			    getStreamBundleName() == false ? getRouting().getBundleRequestMain() : getRouting().getRoutingBundle()[getStreamBundleName()]

			) & 'service.' & this.parseNameDir(serviceName)  & this.parseNameDir(label));
	}

	public Entity function getEntity(String entityName, String label = 'entity')
	{
		/*

				aguardando controller de factory

		*/
		return CreateObject("component",  (

			    getStreamBundleName() == false ? getRouting().getBundleRequestMain() : getRouting().getRoutingBundle()[getStreamBundleName()]

			) & 'entity.' & this.parseNameDir(entityName)  & this.parseNameDir(label));
	}

	public String function parseNameDir(String parseString)
    {

    	/*
    		parse camelcase in string to validation of name file
    	*/

        var temp = LCase(parseString);
        return uCase(left(temp,1)) & right(temp,len(temp)-1);
    }


    public ManifestConfig function getComponent(String nameComponent)
    {
    	return CreateObject('component', 'component/ManifestComponent').init().component(this.parseNameDir(nameComponent));
    }

}







