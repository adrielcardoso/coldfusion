component
    displayname = 'RestController'
    extends = 'app.Component'
{


	public Any function parseRest(app.ManifestConfig context)
	{

		// validate header of the type application/json
		context.getBindRequest().setResponseType('application/json');

		// and 

		// parse method 



		// writeDump(context);

		// abort;	


		// this is mockup
		return true;

		// if return equal false, make exception with status code 403

	}

}
