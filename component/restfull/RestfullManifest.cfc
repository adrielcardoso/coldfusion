import component.ManifestComponent;

component
	accessors = true
    displayname = 'RestfullManifest'
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


	public Any function parseRequest(app.ManifestConfig context)
	{

		try{

			var translater = context.getContainer().getComponent('tag');

			var scenario = context.getRouting().getBundleManifest().getDefineScenario();

			switch(scenario){

				case 'REST' : return getController('rest').parseRest(context);

				// case 'SOAP' : return getController('soap').parseSoap(context);

				default: 
					throw(translater.tag('request.validate.error', [scenario]),  500);
			}

		}catch(Any e){
			
			rethrow;
		}

	}


}

