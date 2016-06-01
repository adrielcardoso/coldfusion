import config.HTTPRequest;
import config.HTTPResponse;

component
    displayname = 'PessoaController'
    extends = 'config.BaseController'
{

    public void function validate(Model entity)
    {
        writeDump('parse validate form');
    }

} 

