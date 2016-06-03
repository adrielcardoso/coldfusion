import config.HTTPRequest;
import config.HTTPResponse;
import config.ManifestConfig;

component
	accessors = true
    displayname = 'ErrorController'
    extends = 'BaseController'
{


	property Routing routing;

	public ErrorController function init(Routing routing){
		setRouting(routing);

		return this;
	}

    public void function error(String message, String status = false)
    {

    	data = {
    		'template' : '/component/template/error/#(!status ? 'error' : 'error#status#')#.cfm',
    		'load' : createObject("component", 'config.TemplateInflate').init(getRouting())
    	};

    	include '/component/template/#getRouting().getBundleManifest().getTemplate()#.cfm';
    }

}

