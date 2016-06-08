component
	accessors = true
    displayname = 'Entity'
    extends = 'ManifestConfig'
{

	property ManifestConfig mContext;

	public ManifestConfig function init(ManifestConfig context)
	{

		setMContext(context);

		return this;
	}

	public app.Form function getForm()
    {

    	var entityName = getMContext().getStEntity();

    	return getMContext().getForm(entityName);
    }

}