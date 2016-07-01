import component.ManifestComponent;

component
	accessors = true
    displayname = 'ResponseManifest'
    extends = 'app.Component'
{

	property Any context;

	public Any function init(Any context)
	{
		/*
			set it request of will get containers
		*/
		setContext(context);

		return this;
	}

	public void function out(struct entity, app.HTTPRequest req)
	{

		// var container = getContainerByName('user');
		var container = getContainer(this);

		if(req.getResponseType() != 'application/json'){
			throw('Format no suported to serialize', 500);
		}

		var cfResponse = getpagecontext().getresponse().getResponse();
		var objectJson = {};

		structInsert(objectJson,"data", container.getController('response').toJson(entity));

		structInsert(objectJson,"status", cfResponse.getStatus());

		cfResponse.setContentType(req.getResponseType());

		// writeOutput
		writeOutput(container.getController('response').toJson(objectJson));

	}

}

