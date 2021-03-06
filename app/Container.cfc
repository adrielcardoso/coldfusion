import app.ManifestConfig;
import app.Form;

component
	accessors = true
    displayname = 'Container'
    extends = 'app.ManifestConfig'
{

	property struct memoryBundle;
	property HTTPRequest request;
	property String streamBundleName;
	property String streamBundleNameReplace;
	property Routing routing;
	property ManifestConfig context;
	property String stEntity;
	property String stValidation;

	public Container function parseContainer(ManifestConfig mContext)
	{

		setStreamBundleName(false);

		setStreamBundleNameReplace(false);

		setRequest(mContext.getBindRequest());

		setContext(mContext);

		setRouting(CreateObject('component', 'app.Routing').main(this));

		return this;
	}

	public Container function getBundle(String bundleName = false)
	{

		setStreamBundleNameReplace(getStreamBundleName());

		setStreamBundleName(bundleName);

		return this;
	}

	public Service function getService(String serviceName, String label = 'service')
	{

		var objectService = CreateObject("component",  (

			    getStreamBundleName() == false ? getRouting().getBundleRequestMain() : getRouting().getRoutingBundle()[getStreamBundleName()]

			) & 'service.' & this.parseNameDir(serviceName)  & this.parseNameDir(label)).init(this);

		return objectService;
	}

	public Entity function getEntity(String entityName, String label = 'entity')
	{

		setStEntity(entityName);

		var objectEntity = CreateObject("component",  (

			    getStreamBundleName() == false ? getRouting().getBundleRequestMain() : getRouting().getRoutingBundle()[getStreamBundleName()]

			) & 'entity.' & this.parseNameDir(entityName)  & this.parseNameDir(label)).init(this);

		return objectEntity;
	}

	public app.ValidationManifest function getValidation(String validation)
	{

		setStValidation(validation);

		var objectEntity = CreateObject("component",  (

			    getStreamBundleName() == false ? getRouting().getBundleRequestMain() : getRouting().getRoutingBundle()[getStreamBundleName()]

			) & 'validation.' & this.parseNameDir(validation));

		return objectEntity;
	}


    public ManifestConfig function getComponent(String nameComponent)
    {
    	var objectComponent = CreateObject('component', 'component/ManifestComponent').init(this).component(this.parseNameDir(nameComponent));

    	return objectComponent;
    }

    public Form function getForm(required String formName, String label = 'form')
    {

    	var objectForm = CreateObject("component",  (

			    getStreamBundleName() == false ? getRouting().getBundleRequestMain() : getRouting().getRoutingBundle()[getStreamBundleName()]

			) & 'form.' & this.parseNameDir(formName)  & this.parseNameDir(label)).init(this);

    	return objectForm;
    }

}







