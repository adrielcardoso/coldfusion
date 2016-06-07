import app.ManifestConfig;
import app.BaseController;

component
	accessors = true
    displayname = 'HTTPResponse'
    extends = 'ManifestConfig'
{

	property HTTPResponse httpResponse;
	property threadMain;
    property stThreadName;
    property Routing routing;

	public HTTPResponse function init(BaseController mContext, String stThreadName, Routing routing)
	{
		setThreadMain(mContext);
		setStThreadName(stThreadName);
		setRouting(routing);

		return this;
	}

    public void function view(String fileName, struct data)
    {
    // writeDump('#getRouting().getBundleRequestMain()#view/#getStThreadName()#/#fileName#.cfm');abort;
    	StructAppend(arguments.data, {
    		'template' : '#getRouting().getBundleRequestMain()#view/#getStThreadName()#/#fileName#.cfm',
    		'load' : createObject("component", 'config.TemplateInflate').init(getRouting())
    	});

        // writeDump(data.template);
        // abort;

    	include '/component/template/#getRouting().getBundleManifest().getTemplate()#.cfm';
    }

}

