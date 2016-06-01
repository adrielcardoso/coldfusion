import config.ManifestConfig;
import controller.BaseController;

component
	accessors = true
    displayname = 'HTTPResponse'
    extends = 'ManifestConfig'
{

	property HTTPResponse httpResponse;
	property threadMain;
    property stThreadName;
	
	public HTTPResponse function init(BaseController mContext, String stThreadName)
	{
		setThreadMain(mContext);
		setStThreadName(stThreadName);
		return this;
	}

    public void function view(String fileName, HTTPResponse res)
    {
    	include  "/view/#getStThreadName()#/#fileName#.cfm";
    }

} 

