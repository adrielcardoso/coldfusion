import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'PessoaController'
    extends = 'BaseController'
{

    public void function init(HTTPRequest req, HTTPResponse res)
    {

    	writeDump(getContainer());
    	abort;

        // bindRequest.isRequest('POST');
        res.view("index", res);
    }

} 
