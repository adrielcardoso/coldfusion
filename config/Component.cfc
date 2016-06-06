component
	accessors = true
    displayname = 'Component'
    extends = 'config.ManifestConfig'
{

	property Component mContext;
	property name = 'nameComponent' default = FALSE;

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

	public String function getContainerName()
	{

		if(getNameComponent() != FALSE)
		{
			return getNameComponent();
		}

		return getMContext().getContext().getComponentName();
	}

}

