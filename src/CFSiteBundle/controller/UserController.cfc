import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'PessoaController'
    extends = 'config.BaseController'
{

    public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
        res.view("index", {});
    }

    public void function actionCreate(HTTPRequest req, HTTPResponse res)
    {

    	if(req.isRequest('POST')){

    		var userCreate = getContainer(req)
    							.getEntity('user').findAll();
    	}

    	res.view("create", {});
    }

    public void function actionUpdate(HTTPRequest req, HTTPResponse res)
    {

    	if(req.isRequest('POST')){

    		var userCreate = getContainer(req)
    							.getService('user').updateUser();
    	}

    	res.view("update", {});
    }

    public void function actionDelete(HTTPRequest req, HTTPResponse res)
    {
    	// if(req.isRequest('PUT')){

    	// 	var userCreate = getContainer(req)
    	// 						.getService('user').createUser();
    	// }
    	req.redirect('main', 'controller');
    }

}

