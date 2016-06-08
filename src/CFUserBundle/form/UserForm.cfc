import app.ManifestConfig;
import app.Form;

component
	accessors = true
    displayname = 'UserForm'
    extends = 'app.Form'
{

	property ManifestConfig mFormContext;

	public ManifestConfig function init(ManifestConfig context)
	{

		setMFormContext(context);

		return this;
	}

}