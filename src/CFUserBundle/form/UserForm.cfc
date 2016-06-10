import app.ManifestConfig;
import app.Form;

component
    displayname = 'UserForm'
    extends = 'app.Form'
{

	public struct function formConfig()
	{
		return {

			'stFullName' : {
				'type': 'text',
				'required': true
			},
			'stEmail' : {
				'type': 'email',
				'required': true
			},
			'stPassw' : {
				'type' : 'text',
				'required' : true
			}
		};
	}

}