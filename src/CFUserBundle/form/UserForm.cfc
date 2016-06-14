import app.ManifestConfig;
import app.Form;

component
    displayname = 'UserForm'
    extends = 'app.Form'
{

	public struct function getRoles()
	{

		return {

				'stEmail,stPassword' : {
					'scenario' : ['login'],
					'required' : true,
					'component' : ['parseEmail', 'parseSenha']
				},

				'stPassword' : {
					'scenario' : ['-login', '-create'],
					'required' : true,
					'component' : ['parseSenha']
				}

		};

	}


}