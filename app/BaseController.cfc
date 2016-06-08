
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
            setMContainer(getContainer(this));

            /*
                define controller access in request
            */
            getMContainer().getBundle('user').getService('security').autorizationRequest(this).finish(getMContainer());

            /*
                validate key security
            */
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

                CreateObject('component', 'ErrorController').init(getRouting())
                            .error(getBindRequest().getMessage(), getBindRequest().getStatusCode());

            }


            getMContainer().parseAfter();


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
       return CreateObject("component",  bundle & LCase(stDirObject) &  "." &this.parseNameDir(stEvent)  &  this.parseNameDir(stDirObject)  );
    }

    public Container function getContainer(ManifestConfig manifestConfig)
    {

        if(!isDefined('manifestConfig')){
            return getMContainer();
        }

        var generateContainer = createObject("component", 'app.Container');

        /*
            begin application, context before
        */
        generateContainer.parseBefore();

        return generateContainer.parseContainer(manifestConfig);
    }

}
