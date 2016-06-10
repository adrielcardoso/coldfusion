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

		writeDump(FORM);

		writeDump(entity);

		writeDump(entity.getForm());

			writeDump('validando '); abort;
	}


	public any function parseEntityinForm()
	{

		writeDump('www');

		abort;
	}


}
