import component.ManifestComponent;

component
	accessors = true
    displayname = 'YamlManifest'
    extends = 'config.Component'
{

	property ManifestComponent context;

	public config.ManifestConfig function init(ManifestComponent context)
	{
		/*
			set it request of will get containers
		*/
		setContext(context);
		return this;
	}

	public void function parseFile()
	{

	}

}

