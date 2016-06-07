import app.HTTPRequest;
import app.HTTPResponse;

component
    displayname = 'MainController'
    extends = 'app.BaseController'
{

	public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
        // req.isRequest('POST')

        // WriteDump(getContainer(req).getBundle('user').getEntity('user'));

        // writeDump(getContainer(req).getService('user'));

        // abort;

        var container = getContainer(req);

        var yaml = container.getComponent('yaml')
                                    .getConfig('config/user.yaml');

        writeDump(yaml);

        abort;

        // res.view("index", {});
    }

}

