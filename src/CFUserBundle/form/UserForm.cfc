import app.ManifestConfig;
import app.Form;

component
    displayname = 'UserForm'
    extends = 'app.Form'
{

	public struct function getRoles()
	{

		return {


				'stEmail, stPassw' : {
					'scenario' : ['login'],
					'required' : true,
					'component' : 'validateCpf'
				},



				'stPassw' : {
					'scenario' : ['-login'],
					'required' : true,
					'component' : 'validateCpf, validateCpf, validateCpf'
				}

		};

	}

}