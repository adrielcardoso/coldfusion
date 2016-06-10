import app.Entity;

component
    displayname = 'FormService'
    extends = 'app.Component'
{

	property ManifestConfig context;

	// public ManifestComponent function init(ManifestConfig context)
	// {
	// 	setContext(context);

	// 	return this;
	// }

	public any function service()
	{

		writeDump('find service OK');

		abort;

	}


}

