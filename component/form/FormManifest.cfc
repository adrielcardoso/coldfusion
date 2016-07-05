import app.Entity;

component
    displayname = 'FormManifest'
    extends = 'app.Component'
{


	public struct function validate(Entity entity)
	{

		entity.getForm().parseBefore(entity);

		/*
			validated and parse required e scenarios
		*/
		var statusValidate = getService('form').validateEntityByForm(entity);

		var response = {};
		if(structCount(statusValidate) > 0){

			for(single in statusValidate){

				if(!structKeyExists(statusValidate[single],"error")){
					throw('error in find object parsed', 500);
				}

				var temp = statusValidate[single].error;

				structInsert(response, single, {'error' : temp});

			}

		}

		entity.getForm().parseAfter(entity);

		return response;

	}

	public String function setError(Any data, String field)
	{

		if(structKeyExists(data, field)){

			if(structKeyExists(data[field], 'error')){

				if(isArray(data[field].error)){

					var message = '';

					for(single in data[field].error){

						message &= ' <br /> '&single;
					}

					return message;

				}

		  	}

		}

	}

	public String function formStatus(struct data, required array dimen)
	{

		try{

			if(IsStruct(data)){

				var message = '';
				var structure = data;

				for(single in dimen){
					var structure = structure[single];
				}

				return structure;
			}

		}catch(Any e){
			return '';
		}
	}

}
