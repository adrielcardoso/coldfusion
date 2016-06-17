
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
    property errorController;

    public void function init()
    {

        try{

            parseBefore();

            /* validate and set query string  */
            setBindRequest(CreateObject("component", 'HTTPRequest').bindRequest());

            /* set Container */
            setMContainer(getContainer(this));

            /* defination of routing to bundles */
            setRouting(getMContainer().getRouting());

            /*   define controller access in request */
            getMContainer().getBundle('user').getService('security').autorizationRequest(this);

            /*  define controller to parse response when exception  */
            setErrorController(CreateObject('component', 'ErrorController').init(getRouting()));

            // parse permission access in route

            // getBindRequest().setBlPermission(true);
            if(getBindRequest().getBlPermission()){

               /* instaced off object  */
                var mContext = createObjectByName(getBindRequest().getStEvent() , 'controller', getRouting().getBundleRequestMain());

                /*
                    define object container to context invoked
                */
                mContext.setMContainer(getMContainer());


                /* object of response to request */
                httpResponse= createObject("component", 'HTTPResponse').init(mContext, LCase(getBindRequest().getStEvent()), getRouting());
                httpResponse.setHttpRequest(getBindRequest());

                /* default method access */
                invoke(mContext, (getBindRequest().getStAction() == 'actionInit' ? 'actionInit' : 'action#parseNameDir(getBindRequest().getStAction())#'), {
                            'req' = getBindRequest(),
                            'res' = httpResponse
                });

                /*
                     last application in context life
                */

            }else{


                /*
                    exception no access permited
                */
                getErrorController().error(getBindRequest().getMessage(), getStatusCode());

            }


            getMContainer().parseAfter();


        }catch(Any exception){

            /*
                    response to controller of error
            */
            getErrorController().error(exception.message, 500);
            // rethrow;
        }

    }

	public BaseController function createObjectByName(String stEvent, String stDirObject = 'controller', String bundle)
    {
       return CreateObject("component",  bundle & LCase(stDirObject) &  "." &this.parseNameDir(stEvent)  &  this.parseNameDir(stDirObject)  );
    }

    public Container function getContainer(ManifestConfig manifestConfig)
    {

        if(!isDefined('manifestConfig')){

            // writeDump(); abort;
            finish(getMContainer());

            return getMContainer();
        }

        var generateContainer = createObject("component", 'app.Container');

        /*
            begin application, context before
        */
        return generateContainer.parseContainer(manifestConfig);

    }

}
