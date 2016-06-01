
import config.HTTPRequest;
import config.HTTPResponse;
// import config.ManifestConfig;

component
	accessors = true
    displayname = 'BaseController'
    extends = 'config.ManifestConfig'
{

    property HTTPRequest bindRequest;
    property HTTPResponse httpResponse;
    property String container;
    
    public void function init()
    {

        try{

            // setContainer('container');

            // abort;
            /* validate and set query string  */
            setBindRequest(CreateObject("component", 'HTTPRequest').bindRequest()); 


           /* instaced off object  */
            var mContext = createObjectByName(getBindRequest().getStEvent() , 'controller');

            /* object of response to request */
            httpResponse= createObject("component", 'HTTPResponse').init(mContext, LCase(getBindRequest().getStEvent()));

            /* default method access */
            invoke(mContext, (getBindRequest().getStAction() == 'init' ? 'init' : 'action#parseNameDir(getBindRequest().getStAction())#'), {
                        'req' = getBindRequest(), 
                        'res' = httpResponse
            });

        }catch(Any exception){

            CreateObject('component', 'ErrorController').error(exception.message, 500);
        }
        
    }

	public BaseController function createObjectByName(String stName, String stDirObject = 'controller')
    {
    	/* find object in formated dynamic   */
       return CreateObject("component","src."&LCase(stDirObject)&"."&this.parseNameDir(stName)&this.parseNameDir(stDirObject));
    }

    public String function parseNameDir(String parseString)
    {
    	/* parse camelcase in string to validation of name file */
        var temp = LCase(parseString);
        return uCase(left(temp,1)) & right(temp,len(temp)-1);
    }

} 
 