import app.HTTPRequest;
import app.HTTPResponse;

component
    displayname = 'UserForm'
{

    public void function validate(Model entity)
    {
        writeDump('parse validate form');
    }

    public function createForm()
    {

    }

}

