/**
* @Comment 
* 
* objetos de entidade que pertence a um bundle ou component devem extender esse centralizador pai;
* 
* Todas entidades que precisaram realizar analise de dados, deve se construir um Form para ela, sendo assim 
* 
* Quando o objeto ser validado o component de validação vai buscar pelo Form com as regras de cada objeto da entidade,
* 
* isso somente sera possivel se a entidade extender o contexto pai app.Entity.cfc
* 
* */

component
	accessors = true
    displayname = 'Entity'
    extends = 'ManifestConfig'
{

	property ManifestConfig mContext;
	property String scenario;

	public ManifestConfig function init(ManifestConfig context)
	{

		setMContext(isDefined("context") ? context : this);

		return this;
	}

	public struct function getForm()
    {

    	var entityName = getMContext().getStEntity();

    	return getMContext().getForm(entityName);
    }

}