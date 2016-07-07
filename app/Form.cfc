import app.ManifestConfig;
import app.Entity;

/**
* @Comment 
* 
* Esse contexto define a gestão de todos os forms, cada forme pertence a uma entidade e cada entidade pertence a um 
* 
* bundle, quando uma entidade precisar definir validação de dados, deve ser criado um form com regras para cada propriedade 
* 
* todos os forms deveram extender este contexto.
* 
* */

component
    displayname = 'Form'
    extends = 'Entity'
	accessors = true
{

	property field;
	property value;
	property tag;

	public any function validate(String str, any value)
	{
		return IsValid(getDataType(str), value);
	}

	/**
	* mapeamento de tipos de validação nativas pelo Coldfusion 11
	* */
	public string function getDataType(String str)
	{
		var objs = [
			'any',
			'array',
			'binary',
			'boolean',
			'component',
			'creditcard',
			'date',
			'time',
			'email',
			'eurodate',
			'float or numeric',
			'guid',
			'integer',
			'query',
			'range',
			'regex',
			'string',
			'struct',
			'telephone',
			'URL',
			'UUIDCreateUUID.',
			'USdate',
			'variableName',
			'zipcode',
			'maxlength'
		];

		for(single in objs){

			if(trim(LCase(single)) == trim(LCase(str))){
				return trim(LCase(single));
			}
		}

		throw('validate "#str#" not found', 500);
	}

	public app.Entity function parseBefore(app.Entity entity)
	{
		return entity;
	}

	public app.Entity function parseAfter(app.Entity entity)
	{
		return entity;
	}

}