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

		var parse = IsValid('email', value);

		return {'status' : parse, 'message' : getTag().translater('validateEmail')};
	}

	public struct function parseSenha(String value)
	{

		var temp = {
				'status' : (len(value) > 8 or len(value) < 3 ? false : true),
				'message' : getTag().translater('validateSenhaLen', [3, 8])
			};

		return temp;
	}

}