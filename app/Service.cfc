import component.orm.*;
import app.*;

component
    accessors=true
    displayname = 'Service'
	extends = 'BaseController'
{

	property name="model" type="Entity";
	property ManifestConfig mContext;


	public Service function init(ManifestConfig mContext)
	{

		/*
			set context defined in container to will searchs
		*/
		setMContainer(mContext.getContext().getMContainer());

		setMContext(mContext);

		return this;
	}

	/*
		define return of container it bundle
	*/
	// public Container function getContainer(ManifestConfig context)
	// {
	// 	return context.getMContainer();
	// }

	public Service function getService(required String nameService)
	{

		// writeDump();

		// abort;

		// return CreateObject('component', 'src/CFUserBundle/service/UserSessionService');

		return CreateObject('component', getDirectoryFromPath(getCurrentTemplatePath()) & this.parseNameDir(nameService) & 'Service');


	}

}







