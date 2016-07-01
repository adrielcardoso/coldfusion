component
    accessors=true
    displayname = 'UserUtilService'
    extends = 'app.Service'
{

	public struct function defineParams()
	{

		var response = {};

		if(structKeyExists(FORM,"offset")){
			structInsert(response,"offset",FORM.offset);
		}

		if(structKeyExists(FORM,"maxresults")){
			structInsert(response,"maxresults",FORM.maxresults);
		}

		return response;
	}

}

