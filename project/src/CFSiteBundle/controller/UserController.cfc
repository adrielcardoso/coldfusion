import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'PessoaController'
    extends = 'config.BaseController'
{

    public void function init(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        res.view("index", res);
    }

} 
