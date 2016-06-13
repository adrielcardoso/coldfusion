import app.Entity;

component
    displayname = 'FormManifest'
    extends = 'app.Component'
{

	// property ManifestConfig context;

	// public ManifestComponent function init(ManifestConfig context)
	// {
	// 	setContext(context);

	// 	return this;
	// }

	public any function validate(Entity entity)
	{

		/*
			validated and parse required e scenarios
		*/
		var statusValidate = getService('form').validateEntityByForm(entity);

		writeDump('ww');

		abort;

		if(statusValidate.status == false){

			var custonService = getService('custonValidation');


			var response = {};

			var data = statusValidate.field;
			for(single in data){


				if(StructKeyExists(data[single], 'component')){

					for(func in data[single].component.split(',')){


						modelValue = (evaluate('entity.get#parseNameDir(single)#()') ?: '');

						if(modelValue != ''){

							// fazer analise com function

							// var responseInvoked = evaluate('custonService.#func#(valueParse)');

							writeDump('custonService.#func#(valueParse)');

							abort;


						}else{


							// vai cair aqui caso o input estiver vazio

							// fazer analise de mensagem com erro

							writeDump('igual a null o valor desse campo');


						}

					}


					writeDump('fim da linha');
					abort;

			   	}

			}

		}

		writeDump(statusValidate);

		abort;

	}


}
