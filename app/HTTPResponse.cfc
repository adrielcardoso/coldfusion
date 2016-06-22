import app.ManifestConfig;
import app.BaseController;

component
	accessors = true
    displayname = 'HTTPResponse'
    extends = 'ManifestConfig'
{

	property HTTPResponse httpResponse;
    property HTTPRequest httpRequest;
	property threadMain;
    property stThreadName;
    property Routing routing;

	public HTTPResponse function init(BaseController mContext, String stThreadName, Routing routing)
	{
		setThreadMain(mContext);
		setStThreadName(stThreadName);
		setRouting(routing);
        setHttpResponse(this);

		return this;
	}

    public void function view(String fileName, struct data)
    {

        if(getHttpRequest().getResponseType() != ''){

            var formate = getHttpRequest().getResponseType();

            var responseComponent = getThreadMain().getContainer().getComponent('response');

            responseComponent.out(data, formate);
        }else{

            // to be continue to view

            StructAppend(data, {
                'template' : '#getRouting().getBundleRequestMain()#view/#getStThreadName()#/#fileName#.cfm',
                'load' : createObject("component", 'app.TemplateInflate').init(getRouting()),
                'form' : createObject("component", 'component.form.FormManifest'),
                'req'  : getHttpRequest()
            });

        	include '/component/template/#getRouting().getBundleManifest().getTemplate()#.cfm';
        }

    }

}

