import app.HTTPRequest;
import app.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'app.BaseController'
{

	/**
	* 
	* @HttpUrl("^/do-something/([0-9]+)$")
	* 
	* */
	public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
    	res.view('default', {});
    }

}

