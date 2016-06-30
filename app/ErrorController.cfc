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

        if(getRouting().getContext().getRequest().getResponseType() != ''){

            var formate = getRouting().getContext().getRequest().getResponseType();

            var responseComponent = getRouting().getContext().getComponent('response');

            responseComponent.out({'data' : message, 'status' : status}, formate);

        }else{

        	data = {
        		'template' : '/component/template/error/#(!status ? 'error' : 'error#status#')#.cfm',
        		'load' : createObject("component", 'app.TemplateInflate').init(getRouting())
        	};

        	include '/component/template/#getRouting().getBundleManifest().getTemplate()#.cfm';
        }

    }

}

