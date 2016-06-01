import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'TercaController'
    extends = 'BaseController'
{

    public void function init(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        
        res.view("index", res);
    }

} 
