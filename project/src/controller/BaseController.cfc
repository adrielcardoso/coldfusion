component
	accessors = true
    output = 'false'
    displayname = 'BaseController'
{

	property String stEvent;
    property String stAction; 
    property boolean blPermission;

    public boolean function parseRequest()
    {
    	/* validate and set query string  */
    	parseQueryString(); 

    	/* instaced off object  */
        try{
            mContext = createObjectByName(getStEvent() ?: 'main', 'controller');
        }catch(any exception){
            writeDump(exception);
        }

        writeDump(mContext);
        

        /* default method access */
        invoke(mContext, (getStAction() == 'init' ? 'init' : 'action#getStAction()#'));

        /* type return if success */
        return true;
    }

	public BaseController function createObjectByName(String stName, String stDirObject = 'controller')
    {
    	/* find object in formated dynamic   */
       return CreateObject("component","src."&LCase(stDirObject)&"."&this.parseNameDir(stName)&this.parseNameDir(stDirObject));
    }

    public String function findEvent(String queryString)
    {
    	/* return element in queryString or return empty */
    	return (IsDefined("URL.#queryString#") ? evaluate("URL.#queryString#") : '');
    }

    public String function parseNameDir(String parseString)
    {
    	/* parse camelcase in string to validation of name file */
        temp = LCase(parseString);
        return uCase(left(temp,1)) & right(temp,len(temp)-1);
    }

    public void function parseQueryString()
    {
    	/* set objectos in query string */
    	setStEvent((findEvent('event') == '' ? 'main' : findEvent('event')));
        setStAction((findEvent('action') == '' ? 'init' : findEvent('action')));

        /* permission off access to user */
        setBlPermission(false);
    }

} 
 