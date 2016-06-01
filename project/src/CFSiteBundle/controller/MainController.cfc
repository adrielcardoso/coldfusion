import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'config.BaseController'
{

	public void function init(HTTPRequest req, HTTPResponse res)
    {
        // req.isRequest('POST')

        // WriteDump(getContainer(req).getBundle('user').getService('user'));

        // writeDump(getContainer(req).getService('user'));

        // abort;

        res.view("index", res);
    }
    
} 

