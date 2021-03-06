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
	property tag;
	property String filePath;

	public ManifestConfig function init(ManifestConfig context)
	{

		// set it request of will get containers
		setDir('/component');

		// add path to translater
		setFilePath('translater');

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
		return createObject("component", '/component/#LCase(getContainerName())#/service/#parseNameDir(nameService)#Service').init(this);
	}

	public Component function getEntity(String nameEntity)
	{
		return createObject("component", '/component/#LCase(getContainerName())#/entity/#parseNameDir(nameEntity)#Entity');
	}

	public Component function getComponent(String nameComponent)
	{
		return getContext().getMContext().getComponent(nameComponent);
		// return createObject("component", '/component/#LCase(nameComponent)#/#parseNameDir(nameComponent)#Manifest');
	}

	public String function getContainerName()
	{

		// writeDump(getContext().getComponentName());

		// abort;
		return getContext().getComponentName();
		// return (getMContext().getContext().getComponentName() ?: getContext().getComponentName());
	}

}

