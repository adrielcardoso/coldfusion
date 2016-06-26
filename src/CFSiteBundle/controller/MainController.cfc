import app.HTTPRequest;
import app.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'app.BaseController'
{

	public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
    	var response = {};

    	structInsert(response, 'name', 'hello world');

        structInsert(response,"assets", {'menu_button' : {'label' : 'Rules', 'bundle' : 'user', 'controller' : 'rule', 'action' : 'list'}});

    	res.view('default', response);
    }

}

