import app.ManifestConfig;
import app.Entity;

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

	// generic method to cycle life of the validation, can be rewritten in the form of the entity
	public app.Entity function parseBefore(app.Entity entity)
	{
		return entity;
	}

	// generic method to cycle life of the validation, can be rewritten in the form of the entity
	public app.Entity function parseAfter(app.Entity entity)
	{
		return entity;
	}


}