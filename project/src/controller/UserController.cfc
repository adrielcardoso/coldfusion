import config.HTTPRequest;
import config.HTTPResponse;

component
    output = 'false'
    displayname = 'PessoaController'
    extends = 'BaseController'
{

    public void function init(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        res.view("index", res);
    }

} 

