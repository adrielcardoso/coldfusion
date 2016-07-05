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

		var container = getContainer(this);

		if(req.getResponseType() != 'application/json'){
			throw('Format no suported to serialize', 500);
		}

		var cfResponse = getpagecontext().getresponse().getResponse().setContentType(req.getResponseType());

		if(structKeyExists(entity,"status")){
			getpagecontext().getresponse().getResponse().setStatus(entity.status);
		}

		// writeOutput
		// "access-control-allow-origin": origin,
  //       "access-control-allow-methods": "GET, POST, PUT, DELETE, OPTIONS",
  //       "access-control-allow-headers": "content-type, accept",
  //       "access-control-max-age": 10, // Seconds.
  //       "content-length": 0

		writeOutput(container.getController('response').toJson(entity));

	}

}

