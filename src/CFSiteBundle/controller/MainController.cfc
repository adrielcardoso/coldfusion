import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'config.BaseController'
{

	public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
        // req.isRequest('POST')

        // WriteDump(getContainer(req).getBundle('user').getEntity('user'));

        // writeDump(getContainer(req).getService('user'));

        // abort;

        // writeDump(getContainer(req).getComponent('user'));


        res.view("index", {});
    }

}

