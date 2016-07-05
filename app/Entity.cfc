component
	accessors = true
    displayname = 'Entity'
    extends = 'ManifestConfig'
{

	property ManifestConfig mContext;
	property String scenario;

	public ManifestConfig function init(ManifestConfig context)
	{

		setMContext(isDefined("context") ? context : this);

		return this;
	}

	public struct function getForm()
    {

    	var entityName = getMContext().getStEntity();

    	return getMContext().getForm(entityName);
    }

}