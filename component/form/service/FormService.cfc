import app.Entity;

component
	accessors = true
    displayname = 'FormService'
    extends = 'app.Component'
{

	property role;
	property entityForm;

	public struct function validateEntityByForm(Entity entity)
	{

		/*
			create object entity by of form
		*/
		bindRequestObject(entity, getDataRequest());

		/*
			form type entity
		*/
		var form = entity.getForm();
		setEntityForm(form);

		/*
			scenario
		*/
		var scenario = entity.getScenario();

		/*
			validated scenario and input values
		*/
		setRole(form.getRoles());
		var structForm = parseAttrsScenario(getRole(), scenario);

		if(structCount(structForm) < 1){
			return {};
		}

		var validateErr = validateBindRequest(entity, structForm);

		var data = {};
		if(StructCount(validateErr) > 0){

			setStatusCode(400);

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

				stFil = Trim(stFil);

				var scenarioExist = false;


				if(StructKeyExists(roles[single], 'scenario') and isArray(roles[single].scenario)){

					if(isScapeScenario(roles[single].scenario, scenario)){
						break;
					}

					for(singleScenario in roles[single].scenario){

						if(singleScenario == scenario){

							// StructInsert(attr, stFil, roles[single]);
							addComponentInStruct(attr, stFil, roles[single]);

							break;
						}

					}

					scenarioExist = true;
				}

				if(scenarioExist == false){

					addComponentInStruct(attr, stFil, roles[single]);
				}

			}

		}

		return attr;

	}

	public struct function addComponentInStruct(struct data, string key, any value)
	{

		if(structKeyExists(data, key)){

			if(structKeyExists(value,"component")){

				parseStruct(data, key, {'component' : value.component});
			}

		}else{

			StructInsert(data, key, value);
		}

		return data;
	}


	public boolean function isScapeScenario(array listScenario, String stScenario)
	{

		// scape scenarios

		for(scenario in listScenario){
			if(Trim(LCase(scenario)) == Trim(LCase('-#stScenario#'))){
				return true;
			}
		}

		return false;

	}

	public struct function validateBindRequest(Entity entity, struct scenarioValication)
	{

		var err = {};
		var permission = false;
		var tag = getContext().getComponent('tag').setPath('translater'); // component translater
		tag.setUserRole(getRole());

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

						// when value is not found and input it is required

						StructInsert(err,inputName,{
							'component' : component,
							'error' : [tag.translater(inputName, 'fieldnotfound', [LCase(inputName)])],
							'required' : required
						});
					}

					found = true;
				}
			}


			// input not found in form

			if(found == false and required == true){

				StructInsert(err,inputName,{
					'component' : component,
					'error' : [tag.translater(inputName, 'fieldnotfound', [LCase(inputName)])],
					'required' : required
				});
			}

		}


		// validate component extern

		for(single in objectFormValidation){

			if(structKeyExists(objectFormValidation[single],"component")){

				for(nameFunction in objectFormValidation[single].component){


					if(len(nameFunction.toString()) > 0){

						var metaForm = GetMetaData(getEntityForm());
						getEntityForm().setTag(tag);

						var validateInForm = false;
						if(structKeyExists(metaForm,"FUNCTIONS")){

							if(isArray(metaForm['FUNCTIONS'])){

								for(singleFunc in metaForm['FUNCTIONS']){

									if(Trim(LCase(singleFunc.NAME.toString())) == Trim(LCase(nameFunction.toString()))){

										getEntityForm().setField(single);
										getEntityForm().setValue(getObject(entity, single).toString());

										var status = evaluate('getEntityForm().#nameFunction#()');

										validateInForm = true;
										break;
									}

								}

							}

						}

						if(validateInForm == false){

							try{

								var content = getContext().getContext().getMContext().getValidation(nameFunction);
								content.setContainer(getContext().getContext().getMContext());

								content.setTag(tag);
								content.init(single, getObject(entity, single).toString());


								if(structKeyExists(content, namefunction)){

									var status = evaluate('content.#namefunction#()');
								}else{

									throw;
								}

							}catch(Any e){

								rethrow;

								throw('Not found method custon #nameFunction#', 500);
							}

						}

						if(status['status'] == false){

							parseStruct(err, single, {'error' : [status.message]});
					 	}

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

	public struct function getDataRequest()
	{
		return FORM;
	}

}

