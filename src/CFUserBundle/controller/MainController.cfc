import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'config.BaseController'
{

	public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        res.view("index", {});
    }
    
} 

