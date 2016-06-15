import app.ManifestConfig;

component
    displayname = 'CustonValidationService'
    extends = 'app.Component'
{


	public struct function validateCpf(String value)
	{

		var serviceCuston = getContext().getController("form");


		return {'status' : false, 'message' : getTag().translater('validateCpf')};
	}

	public struct function parseEmail(String value)
	{

		// var parse = IsValid('email', value);

		// writeDump(parse);abort;

		return {'status' : false, 'message' : getTag().translater('validateEmail')};
	}

	public struct function parseSenha(String value)
	{
		return {'status' : false, 'message' : getTag().translater('validateSenha')};
	}

}