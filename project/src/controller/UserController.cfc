component
    output = 'false'
    displayname = 'PessoaController'
    extends = 'BaseController'
{

    public void function init()
    {
        writeDump('objecto do tipo user');
        abort;
    }

    public void function actionCreate(HTTPRequest bindRequest)
    {
    	writeDump('objecto do tipo create user');
        abort;
    }

} 

