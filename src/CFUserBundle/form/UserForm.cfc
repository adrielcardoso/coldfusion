import app.ManifestConfig;
import app.Form;

component
    displayname = 'UserForm'
    extends = 'app.Form'
{

	public struct function getRoles()
	{

		return {

			'stPassword, stEmail' : {
				'scenario' : ['login'],
				'required' : true,
				'component' : ['parseEmail', 'validateCpf']
			}

		};

	}


}