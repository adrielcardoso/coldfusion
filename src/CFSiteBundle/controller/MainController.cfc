import app.HTTPRequest;
import app.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'app.BaseController'
{

	public void function actionInit(HTTPRequest req, HTTPResponse res)
    {

    	// var container = getContainer();

    	res.view('default', {'name' : 'hello world'});
    }

}

