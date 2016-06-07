
import app.HTTPRequest;
import app.HTTPResponse;
import app.Routing;
// import config.ManifestConfig;

component
	accessors = true
    displayname = 'BaseController'
    extends = 'app.ManifestConfig'
{

    property HTTPRequest bindRequest;
    property HTTPResponse httpResponse;
    property Container mContainer;
    property Routing routing;

    public void function init()
    {

        try{

            /* validate and set query string  */
            setBindRequest(CreateObject("component", 'HTTPRequest').bindRequest());

            /* defination of routing to bundles */
            setRouting(createObject("component", 'Routing').main(getBindRequest()));

            /* set Container */
            setMContainer(getContainer(getBindRequest()));

            /*
                define controller access in request
            */
            getMContainer(getBindRequest()).getBundle('user').getService('security').autorizationRequest(this);

            /*
                validate key security
            */
            if(getBindRequest().getBlPermission()){

               /* instaced off object  */
                var mContext = createObjectByName(getBindRequest().getStEvent() , 'controller', getRouting().getBundleRequestMain());

                /* object of response to request */
                httpResponse= createObject("component", 'HTTPResponse').init(mContext, LCase(getBindRequest().getStEvent()), getRouting());

                /* default method access */
                invoke(mContext, (getBindRequest().getStAction() == 'actionInit' ? 'actionInit' : 'action#parseNameDir(getBindRequest().getStAction())#'), {
                            'req' = getBindRequest(),
                            'res' = httpResponse
                });
            }else{


                /*
                    exception no access permited
                */

                CreateObject('component', 'ErrorController').init(getRouting())
                            .error('OHH VOCE NAO TEM AUTORIZACAO PARA FAZER ISSO', getBindRequest().getStatusCode());

            }


        }catch(Any exception){

            /*

                    response to controller of error
            */
            // CreateObject('component', 'ErrorController').init(getRouting()).error(exception.message, 500);
            rethrow;
        }

    }

	public BaseController function createObjectByName(String stEvent, String stDirObject = 'controller', String bundle)
    {
    	/*
            find object in formated dynamic
        */
       return CreateObject("component",  bundle & LCase(stDirObject) &  "." &this.parseNameDir(stEvent)  &  this.parseNameDir(stDirObject)  );
    }

    // public String function parseNameDir(String parseString) // sera removido este medido e colocado no controler Container
    // {
    // 	parse camelcase in string to validation of name file
    //     var temp = LCase(parseString);
    //     return uCase(left(temp,1)) & right(temp,len(temp)-1);
    // }

    public Container function getContainer(HTTPRequest req)
    {
        return createObject("component", 'app.Container').parseContainer(req);
    }

}
