import app.ManifestConfig;
import app.Form;

component
    displayname = 'UserForm'
    extends = 'app.Form'
{

	public struct function getRoles()
	{

		return {

			'stEmail' : {
				'scenario' : ['login', 'create'],
				'required' : true,
				'component' : ['parseEmail']
			},

			'stPassword' : {
				'required' : true,
				'scenario' : ['login', 'create']
			},

			'stFullName' : {
				'required' : true
			}
		};

	}

	// public struct function cpfValidation()
	// {

	// 	writeDump('dentro de form cpfValidation');abort;
	// 	return {};
	// }

	public struct function parseEmail()
	{

		var status = validate("email", getValue());

		return {'status' : status, 'message' : getTag().translater(getField(), 'validateEmail')};

	}

}