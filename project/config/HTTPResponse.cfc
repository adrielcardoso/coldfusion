import config.ManifestConfig;
import config.BaseController;

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

    public void function view(String fileName, HTTPResponse res)
    {
    	include  getRouting().getBundleRequestMain() & 'view/#getStThreadName()#/#fileName#.cfm';
    }

} 

