import app.ManifestConfig;

/**
* @Comment 
* 
* Todos os recursos registrados no component, serão filhos desse contexto, Component.cfc.
* 
* Para que seja definido uma gestão controlada os componentes devem esteder esse contexto, todos os pedidos 
* 
* e necessidades que um component precisar esse contexto vai atender com a necessidade, ou seja.
* 
* dessa forma definimos que tambem dentro de qualquer component terá a disponibilidade de um MVC, com isso o component 
* 
* Tambem pode fazer injeção de dependencia de serviços de Bundles especificos.
* 
* */

component
	accessors = true
    displayname = 'Component'
    extends = 'app.ManifestConfig'
{

	property Component mContext; 
	property ManifestConfig context;
	property dir;
	property name = 'nameComponent' default = FALSE;
	property tag;
	property String filePath;

	public ManifestConfig function init(ManifestConfig context)
	{

		setDir('/component');

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
	}

	public String function getContainerName()
	{
		return getContext().getComponentName();
	}

}

