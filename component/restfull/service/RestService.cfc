component
    displayname = 'RestService'
    extends = 'app.Component'
{


	public Any function responseView(app.ManifestConfig context)
	{
		


		// validate header of the type application/json


		writeDump('context.getHttpRequest().getResponseType()');

		abort;


		// parse method 


		writeDump(HTTP);



		abort;

	}

}



// getMContainer().getBundle('user').getService('security').autorizationRequest(this)