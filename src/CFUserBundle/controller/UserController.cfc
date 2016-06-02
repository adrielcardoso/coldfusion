import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'PessoaController'
    extends = 'config.BaseController'
{

    public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        res.view("index", {});
    }

    public void function actionCreate(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        res.view("index", {});
    }

} 

