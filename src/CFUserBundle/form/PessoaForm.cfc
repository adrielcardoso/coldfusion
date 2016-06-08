import app.ManifestConfig;
import app.Form;

component
	accessors = true
    displayname = 'PessoaForm'
    extends = 'app.Form'
{

	property ManifestConfig mFormContext;

	public ManifestConfig function init(ManifestConfig context)
	{

		setMFormContext(context);

		return this;
	}

}