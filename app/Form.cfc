import app.ManifestConfig;
import app.Entity;

component
    displayname = 'Form'
    extends = 'Entity'
{

	public ManifestConfig function init(ManifestConfig context)
	{

		writeDump('init form');

		abort;

		setContext(context);

		return this;
	}

}