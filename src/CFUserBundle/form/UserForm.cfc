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
				'required' : true
			},

			'stPassword' : {
				'required' : true,
				'scenario' : ['login', 'create'],
				'component' : ['cpfValidation']
			},

			'stFullName' : {
				'tag' : 'CFUserBundle.user.fullname',
				'required' : true
			}
		};

	}


	// public struct function cpfValidation()
	// {

	// 	writeDump('dentro de form cpfValidation');abort;
	// 	return {};
	// }


}