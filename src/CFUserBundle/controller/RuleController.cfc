import app.HTTPRequest;
import app.HTTPResponse;

component
	displayname = 'RuleController'
    extends = 'app.BaseController'
{

	public void function actionList(HTTPRequest req, HTTPResponse res)
    {

        var response = {};

        var container = getContainer();

        // define params
        structInsert(response,"assets", {'menu_button' : {'label' : 'voltar', 'bundle' : 'main', 'controller' : 'main', 'action' : 'init'}});

        res.view('index', response);
    }

    void function actionFindList(HTTPRequest req, HTTPResponse res)
    {

         if(len(req.getKey('responsetype')) == 0){
            throw('request type incorrect', 403);
         }

         var container = getContainer();

         var response = {};

         var userUtilService = container.getService('userUtil');

         // get component orm
         var component = container.getComponent('orm');

         // find user and all rules
         var userEntity = component.findByQuery('from UserEntity', false, userUtilService.parseValidateByForm());

         // push object in struct
         structInsert(response,"userList", userEntity);

         res.view(false, response);

    }

}