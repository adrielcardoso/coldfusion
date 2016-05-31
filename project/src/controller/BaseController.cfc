component
	accessors = true
    displayname = 'BaseController'
    extends = 'ComponentConfiguration'
{

    property HTTPRequest bindRequest;

    public boolean function init()
    {

        try{

            /* validate and set query string  */
            setBindRequest(CreateObject("component", 'src.controller.HTTPRequest').bindRequest()); 

    	   /* instaced off object  */
            var mContext = createObjectByName(getBindRequest().getStEvent() , 'controller');

            /* default method access */
            invoke(mContext, (getBindRequest().getStAction() == 'init' ? 'init' : 'action#parseNameDir(getBindRequest().getStAction())#'), {'bindRequest' = getBindRequest()});

            /* type return if success */
            return true;

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
 