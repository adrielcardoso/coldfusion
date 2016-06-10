import app.Entity;

component
    displayname = 'FormController'
    extends = 'app.Component'
{

	property ManifestConfig context;

	// public ManifestComponent function init(ManifestConfig context)
	// {
	// 	setContext(context);

	// 	return this;
	// }

	public any function controller(Entity entity)
	{

		writeDump('find controller OK');

		abort;

	}


}

