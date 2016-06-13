import app.ManifestConfig;

component
	accessors = true
    displayname = 'Component'
    extends = 'app.ManifestConfig'
{

	property Component mContext; // property component request.
	property ManifestConfig context;
	property dir;
	property name = 'nameComponent' default = FALSE;

	public ManifestConfig function init(ManifestConfig context)
	{

		// set it request of will get containers
		setDir('/component');

		setContext(context);

		return this;
	}

	public Component function getContainer(Component component)
	{

		setMContext(component);

		return this;
	}

	public Component function getContainerByName(String nameComponent)
	{

		setNameComponent(nameComponent);

		return this;
	}

	public Component function getController(String nameController)
	{
		return createObject("component", '/component/#LCase(getContainerName())#/controller/#parseNameDir(nameController)#Controller');
	}

	public Component function getService(String nameService)
	{
		return createObject("component", '/component/#LCase(getContainerName())#/service/#parseNameDir(nameService)#Service');
	}

	public Component function getEntity(String nameEntity)
	{
		return createObject("component", '/component/#LCase(getContainerName())#/entity/#parseNameDir(nameEntity)#Entity');
	}

	public Component function getComponent(String nameComponent)
	{
		return createObject("component", '/component/#LCase(nameComponent)#/#parseNameDir(nameComponent)#Manifest');
	}

	public String function getContainerName()
	{
		return (getMContext().getContext().getComponentName() ?: getContext().getComponentName());
	}

}

