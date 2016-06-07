import app.HTTPRequest;
import app.HTTPResponse;
import app.ManifestConfig;

component
	accessors = true
    displayname = 'ErrorController'
    extends = 'BaseController'
{


	property Routing routing;

	public ErrorController function init(Routing routing)
    {
		setRouting(routing);

		return this;
	}

    public void function error(String message, String status = false)
    {

    	data = {
    		'template' : '/component/template/error/#(!status ? 'error' : 'error#status#')#.cfm',
    		'load' : createObject("component", 'app.TemplateInflate').init(getRouting())
    	};

    	include '/component/template/#getRouting().getBundleManifest().getTemplate()#.cfm';
    }

}

