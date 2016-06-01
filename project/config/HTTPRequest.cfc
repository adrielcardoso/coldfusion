import config.ManifestConfig;

component
    accessors = true
    displayname = 'HTTPRequest'
    extends = 'ManifestConfig'
{

    property String stBundle;
    property String stEvent;
    property String stAction; 
    property boolean blPermission;
    property String method;
    property struct args;

    // property String POST;
    // property name = 'post' default = 'POST';
    // property name = 'get' default = 'POST';
    // property name = 'put' default = 'POST';
    // property name = 'delete' default = 'POST';

    public HTTPRequest function bindRequest()
    {

        /* set objectos in query string */
        setStBundle(getKey('bundle'));
        setStEvent((getKey('event') == '' ? 'main' : getKey('event')));
        setStAction((getKey('action') == '' ? 'init' : getKey('action')));
        // setArgs(URL);
        setMethod(CGI.REQUEST_METHOD);

        /* permission off access to user */
        setBlPermission(false);

        return this;
    }

    public String function getKey(String queryString)
    {
        /* return element in queryString or return empty */
        return (IsDefined("URL.#queryString#") ? evaluate("URL.#queryString#") : '');
    }

    // public String function getKey(String key)
    // {
    //    try{
    //         return getArgs()[key];
    //    }catch(Any e){
    //         return '';
    //    }
    // }

    public boolean function isRequest(String typeRequest)
    {
         return (typeRequest == getMethod() ? true : false);
    }

} 

