import app.HTTPRequest;
import app.HTTPResponse;

component
	displayname = 'CredentialController'
    extends = 'app.BaseController'
{

    public void function actionLogin(HTTPRequest req, HTTPResponse res)
    {

        var container = getContainer();

        var userEntity = container.getBundle('main').getEntity('user');

        // var formComponet = getContainer().getComponent('form');

        // writeDump(userEntity.getForm().validate());
        // abort;

    	if(req.isRequest('POST')){

    		writeDump(FORM);
    	}

    	res.view('login', {});
    }

    public void function actionCreate(HTTPRequest req, HTTPResponse res)
    {
    	res.view('create', {});
    }

    public void function actionEdit(HTTPRequest req, HTTPResponse res)
    {
    	res.view('edit', {});
    }

    public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
    	res.view('index', {});
    }

}

