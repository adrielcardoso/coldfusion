component
	accessors = true
    displayname = 'RestController'
    extends = 'app.Component'
{

	property name = 'responseDefaultType' default = 'application/json';

	public Any function parseRest(app.ManifestConfig context)
	{

		context.getBindRequest().setResponseType(getResponseDefaultType());

		var httpHead = GetHttpRequestData()['headers'];

		var translater = context.getContainer().getComponent('tag');

		if(httpHead['content-type'] != getResponseDefaultType()){
			
			throw(translater.tag('request.validate.contentype', [getResponseDefaultType()]), 403);
		}

		// validate header of the type application/json

		return true;

	}

}
