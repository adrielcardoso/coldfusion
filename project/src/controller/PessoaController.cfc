component
    output = 'false'
    displayname = 'PessoaController'
    extends = 'BaseController'
{

    public void function init(HTTPRequest bindRequest)
    {
        // bindRequest.isRequest('POST')
        
        writeDump(this.view("saasd"));

        abort;
    }


    public String function actionFindall(HTTPRequest bindRequest)
    {
    	writeDump('objecto do tipo pessoa, findall');
        abort;
    }

} 

