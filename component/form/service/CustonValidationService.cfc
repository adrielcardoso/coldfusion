import app.ManifestConfig;

component
    displayname = 'CustonValidationService'
    extends = 'app.Component'
{


	public struct function validateCpf(String value)
	{
		return {'status' : false, 'message' : 'o CPF está incorreto'};
	}

	public struct function parseEmail(String value)
	{
		return {'status' : false, 'message' : 'o E-MAIL está incorreto'};
	}

	public struct function parseSenha(String value)
	{
		return {'status' : false, 'message' : 'a SENHA está incorreto'};
	}

	public struct function parseCred(String value)
	{
		return {'status' : false, 'message' : 'Nada disso'};
	}

	public struct function parseNads(String value)
	{
		return {'status' : false, 'message' : 'Esse campo esta errado nao EXISTE'};
	}

}