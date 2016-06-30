component
    accessors=true
    displayname = 'UserUtilService'
    extends = 'app.Service'
{

	struct function parseValidateByForm()
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

