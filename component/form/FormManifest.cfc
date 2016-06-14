import app.Entity;

component
    displayname = 'FormManifest'
    extends = 'app.Component'
{

	// property ManifestConfig context;

	// public ManifestComponent function init(ManifestConfig context)
	// {
	// 	setContext(context);

	// 	return this;
	// }

	public any function validate(Entity entity)
	{

		/*
			validated and parse required e scenarios
		*/
		var statusValidate = getService('form').validateEntityByForm(entity);

		writeDump(statusValidate);

		abort;

	}


}
