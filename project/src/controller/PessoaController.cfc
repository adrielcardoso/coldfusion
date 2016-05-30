component
    output = 'false'
    displayname = 'PessoaController'
    extends = 'BaseController'
{

    public void function init()
    {
        writeDump('objecto do tipo pessoa');
        abort;
    }


    public String function actionFindAll()
    {
    	writeDump('objecto do tipo pessoa, findall');
        abort;
    }

} 

