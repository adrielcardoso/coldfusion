import app.ManifestConfig;
import app.Form;

component
    displayname = 'UserForm'
    extends = 'app.Form'
{

	public app.Entity function parseBefore(app.Entity entity)
	{
		return entity;
	}

	public app.Entity function parseAfter(app.Entity entity)
	{
		return entity;
	}

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
				'component' : ['passwValidation']
			},

			'stFullName' : {
				'scenario' : ['-login', 'create'],
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

	// public struct function parseFullName()
	// {
	// 	return {
	// 		'status' : false, message : getTag().translater(getField(), 'CFUserBundle.user.fullname')
	// 	};
	// }

}