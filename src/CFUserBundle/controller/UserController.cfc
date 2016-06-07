import app.HTTPRequest;
import app.HTTPResponse;

component
    extends = 'app.BaseController'
{

    public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        var entityService = getContainer(req).getService('User');
        provider = entityService.search();
        data = provider.getData();
        pagination = provider.getPagination();
        pages = pagination.getPages();

        res.view("index", {
            'data' : data,
            'pagination' : pagination,
            'pages' : pages
        });
    }

    public void function actionDetails(HTTPRequest req, HTTPResponse res)
    {
        var entityService = getContainer(req).getService('User');

        res.view("details", {
            user : entityService.findByPk(req.getKey('id'))
        });
    }

    public void function actionUpdate(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        res.view("update", {});
    }
    public void function actionCreate(HTTPRequest req, HTTPResponse res)
    {
        // bindRequest.isRequest('POST')
        res.view("create", {});
    }

}

