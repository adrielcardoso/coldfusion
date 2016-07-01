import app.HTTPRequest;
import app.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'app.BaseController'
{

	public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
    	res.view('default', {});
    }

}

