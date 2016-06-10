component
    displayname = 'FormManifest'
    extends = 'app.Component'
{

	property ManifestConfig context;

	// public ManifestComponent function init(ManifestConfig context)
	// {
	// 	setContext(context);

	// 	return this;
	// }

	public struct function validate()
	{

		writeDump('validate');

		abort;

	}


}

