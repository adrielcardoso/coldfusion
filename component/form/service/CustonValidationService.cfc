import app.ManifestConfig;

component
    displayname = 'CustonValidationService'
    extends = 'app.Component'
{


	public struct function validateCpf(String stCpf)
	{
		return {'status' : false, 'message' : 'o CPF está incorreto'};
	}

	public struct function parseEmail(String email)
	{
		return {'status' : false, 'message' : 'o E-MAIL está incorreto'};
	}

	public struct function parseSenha(String senha)
	{
		return {'status' : false, 'message' : 'a SENHA está incorreto'};
	}

}