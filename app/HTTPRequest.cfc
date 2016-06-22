import app.ManifestConfig;

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
    property int statusCode;
    property String message;
    property String responseType;

    public HTTPRequest function bindRequest()
    {

        /* set objectos in query string */
        setStBundle(getKey('bundle') == '' ? 'main' : getKey('bundle'));
        setStEvent((getKey('event') == '' ?  'main' : getKey('event')));
        setStAction((getKey('action') == '' ? 'actionInit' : getKey('action')));
        setResponseType(LCase(getKey('responsetype')));

        // setArgs(URL);
        setMethod(CGI.REQUEST_METHOD);

        /* permission off access to user and set default message to view*/
        setBlPermission(false);
        setMessage('ocorreu algum problema ao tentar acessar essa página, verifique com o administrador do sistema');

        return this;
    }

    public String function getKey(String queryString)
    {
        /* return element in queryString or return empty */
        return (IsDefined("URL.#queryString#") ? evaluate("URL.#queryString#") : '');
    }

    public boolean function isRequest(String typeRequest)
    {
         return (typeRequest == getMethod() ? true : false);
    }

    public void function redirect(String bundle = 'main', String controller, String action = false, struct arg = {})
    {

        var args = '';
        if(!StructIsEmpty(arg)){
            for (item in StructKeyArray(arg)){
                args &= '&#item#=#arg[item]#';
            }
        }

        location(application.basedir&"?bundle=#bundle#&event=#controller#" & (action != false ? '&action=#action#' : '') & args, false);
    }

    public void function redirectRoot()
    {
        location(application.basedir, false);
    }

}

