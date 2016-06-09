import component.ManifestComponent;

component
	accessors = true
    displayname = 'ResponseManifest'
    extends = 'app.Component'
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

	public void function out(config.Entity entity, String type = 'json')
	{

		// var container = getContainerByName('user');
		var container = getContainer(this);
		var controller = container.getController('response');

		// var controller = container.getController('user');
		// var tempObject = container.getEntity('response');

		// writeDump(tempObject);

		// writeDump(entity);

		var objectJson = controller.toJson(entity);
		// writeDump(container.getService('response'));

		// out
		writeOutput(objectJson);
	}

}

