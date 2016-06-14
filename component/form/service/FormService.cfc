import app.Entity;

component
    displayname = 'FormService'
    extends = 'app.Component'
{

	public struct function validateEntityByForm(Entity entity)
	{

		/*
			create object entity by of form
		*/
		bindRequestObject(entity, FORM);

		/*
			form type entity
		*/
		var form = entity.getForm();

		/*
			scenario
		*/
		var scenario = entity.getScenario();

		/*
			validated scenario and input values
		*/
		var validateErr = validateBindRequest(entity, parseAttrsScenario(form.getRoles(), scenario));

		var data = {};
		if(StructCount(validateErr) > 0){

			return validateErr;
		}

		return {}; // not found errors

	}

	public struct function parseAttrsScenario(struct roles, String scenario)
	{

		/*
			search all attrs with scenary compatible
		*/

		var attr = {};

		for(single in roles){ // if 1x

			for(stFil in single.split(',')){ // here equals 1x, when more fields more validation

				var scenarioExist = false;

				if(StructKeyExists(roles[single], 'scenario') and isArray(roles[single].scenario)){

					if(isScapeScenario(roles[single].scenario, scenario)){
						break;
					}

					for(singleScenario in roles[single].scenario){

						if(singleScenario == scenario){

							StructInsert(attr, stFil, roles[single]);
							break;
						}
					}

					scenarioExist = true;
				}

				if(scenarioExist == false){
					StructInsert(attr, stFil, roles[single]);
				}

			}

		}

		return attr;
	}


	public boolean function isScapeScenario(array listScenario, String stScenario)
	{

		for(scenario in listScenario){
			if(Trim(LCase(scenario)) == Trim(LCase('-#stScenario#'))){
				return true;
			}
		}

		return false;

	}

	public struct function validateBindRequest(Entity entity, struct scenarioValication)
	{

		// parseStruct(temp, 'data', {'message' : 'hello'});

		var err = {};
		var permission = false;

		if(structCount(scenarioValication) > 0){
			var objectFormValidation = scenarioValication;
		}else{
			var objectFormValidation = entity.getForm().getRoles();
		}

		for(single in objectFormValidation){

			var inputName = single;
			var required = StructKeyExists(scenarioValication[single], 'required') ?
			                             scenarioValication[inputName]['required'] : false;

			var component = StructKeyExists(scenarioValication[single], 'component') ?
			                             scenarioValication[inputName]['component'] : false;

			var found = false;
			for(unique in GetMetaData(entity).PROPERTIES){

				if(Trim(LCase(unique.NAME)) == Trim(lCase(inputName))){

					if(required == true and
							len(evaluate('entity.get#parseNameDir(unique.NAME)#()')) == 0){

						StructInsert(err,inputName,{
							'component' : component,
							'error' : ['O Campo está vazio'],
							'required' : required
						});
					}

					found = true;
				}
			}

			// input not found
			if(found == false and required == true){

				StructInsert(err,inputName,{
					'component' : component,
					'error' : ['input nao encontrado'],
					'required' : required
				});
			}

		}

		var serviceCuston = getContext().getService("custonValidation");

		for(single in err){

			for(nameFunction in err[single].component){

				if(!StructKeyExists(serviceCuston, nameFunction)){
					throw ('Function #nameFunction# custon not found', 500);
				}

				if(len(nameFunction.toString()) > 0){

					var status = evaluate('serviceCuston.#nameFunction#(#getObject(entity, single).toString()#)');

					if(status['status'] == false){

						parseStruct(err, single, {'error' : [status.message]});
				 	}
				}
			}
		}


		return err;

	}

	public Entity function bindRequestObject(Entity entity, struct objectForm)
	{

		for(single in GetMetaData(entity).PROPERTIES){

			var value = getElement(objectForm, ToString(uCase(single.NAME)));

			if(value != ''){
				evaluate('entity.set#parseNameDir(single.NAME)#("#value#")');
			}

		}

		return entity;

	}

	public String function getElement(struct objectForm, String parseKey)
	{
		try{
			return objectForm[parseKey];
		}catch(Any e){
			return "";
		}
	}

	public String function getObject(Entity entity, String attr)
	{
		try{
			return evaluate('entity.get#parseNameDir(attr)#()').toString();
		}catch(Any e){
			return "";
		}
	}

}

