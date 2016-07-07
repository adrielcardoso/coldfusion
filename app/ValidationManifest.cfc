import app.ManifestConfig;

/**
* 
* @Comment 
* 
* Esse contexto serve para auxiliar uma validação de dados de um component dentro de um Form.
* 
* ou seja, cada entidade que precisar validar dados deve se tambem ter um Form com as regras de cada 
* 
* propriedade, quando um metodo de validação for necessario
* 
* */

component
    displayname = 'ValidationManifest'
    extends = 'app.ManifestConfig'
	accessors = true
{

	property field;
	property value;
	property tag;
	property container;

	public app.ValidationManifest function init(String field, String value)
	{

		setField(field);
		setValue(value);

		return this;
	}


}