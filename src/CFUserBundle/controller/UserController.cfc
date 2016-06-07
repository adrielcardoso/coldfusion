import app.HTTPRequest;
import app.HTTPResponse;

component
    extends = 'app.BaseController'
{

    public void function actionInit(HTTPRequest req, HTTPResponse res)
    {

        writeDump('login');

        abort;


        res.view("index", {
            'data' : data,
            'pagination' : pagination,
            'pages' : pages
        });
    }


}

