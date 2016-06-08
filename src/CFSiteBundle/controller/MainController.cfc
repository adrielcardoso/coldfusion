import app.HTTPRequest;
import app.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'app.BaseController'
{

	public void function actionInit(HTTPRequest req, HTTPResponse res)
    {

    	// writeDump(getContainer().getService('user'));


    	// abort;


        res.view("index", {});
    }

}

