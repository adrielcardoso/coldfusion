import app.ManifestConfig;

component
    displayname = 'PasswValidation'
    extends = 'app.ValidationManifest'
{

	public struct function passwValidation()
	{

		var status = !(len(getValue()) > 8 || len(getValue()) < 3);

		var message = (!status ? getTag().translater(getField(), 'validateSenhaLen') : '');

		return {
			'status' : status, message : getTag().translater(getField(), 'validateSenha')
		};

	}

}