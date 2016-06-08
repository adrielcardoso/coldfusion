import app.ManifestConfig;

component
	accessors = true
    displayname = 'Container'
    extends = 'app.ManifestConfig'
{

	property struct memoryBundle;
	property HTTPRequest request;
	property String streamBundleName;
	property Routing routing;
	property ManifestConfig context;

	public Container function parseContainer(ManifestConfig mContext)
	{

		/*
			set registre of bundles to find services
		*/

		setRouting(CreateObject('component', 'app.Routing').main(mContext.getBindRequest()));
		setStreamBundleName(false);
		setRequest(mContext.getBindRequest());
		setContext(mContext);

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

			) & 'service.' & this.parseNameDir(serviceName)  & this.parseNameDir(label)).init(this);
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


    public ManifestConfig function getComponent(String nameComponent)
    {
    	return CreateObject('component', 'component/ManifestComponent').init(getRequest()).component(this.parseNameDir(nameComponent));
    }

}







