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

	public array function getDataType()
	{
		return [
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
	}

}