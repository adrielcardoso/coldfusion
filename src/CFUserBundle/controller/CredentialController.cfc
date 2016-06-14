import app.HTTPRequest;
import app.HTTPResponse;

component
	displayname = 'CredentialController'
    extends = 'app.BaseController'
{

    public void function actionLogin(HTTPRequest req, HTTPResponse res)
    {

        var container = getContainer();
        var userEntity = container.getEntity('user');

        userEntity.setScenario('login');

        // when is method POST is validate in component.
        var response = {};
    	if(req.isRequest('POST')){

            response = getContainer().getComponent('form').validate(userEntity);

            writeDump(response);
    	}

    	res.view('login', response);
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

