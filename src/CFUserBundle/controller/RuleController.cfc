import app.HTTPRequest;
import app.HTTPResponse;

component
	displayname = 'RuleController'
    extends = 'app.BaseController'
{

    /*
        all definitions of the request in controller, they are behind of the package alias
        ex: http://localhost/bundle_alias/  here define end-point to ... "rule/{idRule}"

        add in annotation attr Route with definition - @Route "rule/{idRule}/find"
    */

    /**
    * @method "GET"
    * @HttpUrl("/do-something/")
    * 
    */
    public void function actionFindList(HTTPRequest req, HTTPResponse res)
    {

         var container = getContainer();

         // var translater = container.getComponent('tag');
         var response = container.getComponent('response');

         var data = {};
         var userEntity = {};

         var userUtilService = container.getService('userUtil');

         // get component orm
         var component = container.getComponent('orm');

         // find user and all rules
         userEntity = component.findByQuery('from UserEntity', false, userUtilService.defineParams());

         // push object in struct
         structInsert(data,"rules", userEntity);

         response.out(data, req);

    }


     /**
    * @method "GET"
    * @HttpUrl("/rule/{idRule}/detail")
    * 
    */
    public void function actionDetailRule(int idRule)
    {


    }

}