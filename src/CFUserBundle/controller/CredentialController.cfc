import app.HTTPRequest;
import app.HTTPResponse;

component
	displayname = 'CredentialController'
    extends = 'app.BaseController'
{

    public void function actionLogout(HTTPRequest req, HTTPResponse res)
    {
        var userSession = getContainer().getService('userSession');

        userSession.setUser({});

        req.redirectRoot();
    }

    public void function actionLogin(HTTPRequest req, HTTPResponse res)
    {

        var container = getContainer();
        var userEntity = container.getEntity('user');

        userEntity.setScenario('login');

        // when is method POST is validate in component.
        var response = {};
    	if(req.isRequest('POST')){

            response = getContainer().getComponent('form').validate(userEntity);

            if(getStatusCode() == 200){

                var userAutenticate = getContainer().getService('UserAutenticate');
                var translater = getContainer().getComponent('tag');

                var statusCredential = userAutenticate.parseLogin(
                                userEntity.getStEmail(), userEntity.getStPassword());

                // define when credential equals tru
                if(statusCredential == true){

                    var userService = getContainer().getService('user');
                    var userSessionService = getContainer().getService('UserSession');
                    var securityService = getContainer().getService('security');

                    // find user by email
                    userEntity = userService.findUserByEmail(userEntity.getStEmail());

                    // find roles by user id
                    userRule = userService.findRuleByUserId(userEntity.getId());

                    // writeDump(userEntity);
                    // abort;

                    var userSession = userSessionService.setUser({
                            'user' : userEntity,
                            'rule' : userRule
                        });

                    if(isStruct(userSession) and StructCount(userSession) > 0){
                        req.redirectRoot(securityService.getRoutDefaultRedirect(securityService.load()));
                    }

                }else{

                    structInsert(response,"status_request_form", {
                        'status' : true, 'message' : translater.tag('cfuserbundle.user.scenario.login.error')});
                }

            }

    	}

    	res.view('login', response);
    }

    public void function actionCreate(HTTPRequest req, HTTPResponse res)
    {

        var response = {};
        var container = getContainer();
        var userEntity = container.getEntity('user');

        userEntity.setScenario('create');

        // when is method POST is validate in component.
        if(req.isRequest('POST')){

            response = getContainer().getComponent('form').validate(userEntity);

            if(getStatusCode() == 200){

                var translater = container.getComponent('tag');
                var ormService = getContainer().getComponent('orm');
                var userService = getContainer().getService('user');
                var userSessionService = getContainer().getService('UserSession');
                var securityService = getContainer().getService('security');

                if(ormService.insert(userEntity)){

                    structInsert(response,"status_request_post", {
                        'status' : true, 'message' : translater.tag('cfuserbundle.user.scenario.create.success')});

                    // create default rule and return value equals RULE_USER in array
                    var userRule = userService.createRuleRawUser(userEntity.getId());

                    // set in session the credential of the user
                     var userSession = userSessionService.setUser({
                            'user' : userEntity,
                            'rule' : userRule
                        });

                    if(isStruct(userSession) and StructCount(userSession) > 0){
                        req.redirectRoot(securityService.getRoutDefaultRedirect(securityService.load()));
                    }

                }else{

                    structInsert(response,"status_request_post", {
                        'status' : false, 'message' : translater.tag('cfuserbundle.user.scenario.create.error')});
                }

            }

        }

    	res.view('create', response);
    }

    public void function actionEdit(HTTPRequest req, HTTPResponse res)
    {
    	res.view('edit', {});
    }

    public void function actionInit(HTTPRequest req, HTTPResponse res)
    {
    	res.view('index', {});
    }

}

