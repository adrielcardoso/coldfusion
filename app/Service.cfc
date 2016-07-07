import app.ManifestConfig;
import app.HTTPRequest;

/**
* @Comment 
* 
* para uma gestão controlada todos os serviços devem extender o app.Service 
* 
* Responsavel por inicializar com contexto de origem da requisição, dado suporte para acessos 
* 
* a recursos para todos os seus filhos.
* 
* */

component
    accessors=true
    displayname = 'Service'
	extends = 'BaseController'
{

	property name="model" type="Entity";
	property ManifestConfig mContext;

	public Service function init(ManifestConfig mContext)
	{
		setMContainer(mContext.getContext().getMContainer());

		setMContext(mContext);

		return this;
	}

	public Service function getService(required String nameService)
	{
		return CreateObject('component', getDirectoryFromPath(getCurrentTemplatePath()) & this.parseNameDir(nameService) & 'Service');
	}

}







