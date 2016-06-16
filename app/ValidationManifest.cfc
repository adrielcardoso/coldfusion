import app.ManifestConfig;

component
    displayname = 'ValidationManifest'
    extends = 'app.ManifestConfig'
	accessors = true
{

	property field;
	property value;
	property tag;
	property container;

	public app.ValidationManifest function init(String field, String value)
	{

		setField(field);
		setValue(value);

		return this;
	}


}