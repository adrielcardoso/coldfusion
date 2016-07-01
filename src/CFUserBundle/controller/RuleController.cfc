import app.HTTPRequest;
import app.HTTPResponse;

component
	displayname = 'RuleController'
    extends = 'app.BaseController'
{

    /**
    * @method "GET"
    */
    public void function actionFindList(HTTPRequest req, HTTPResponse res)
    {

         var container = getContainer();

         // var translater = container.getComponent('tag');
         var response = container.getComponent('response');

         // if(!req.isRequest('GET')){
         //    throw(translater.tag('request.validate.method'), 403);
         // }

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

}