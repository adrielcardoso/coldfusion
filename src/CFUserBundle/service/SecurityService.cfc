import app.ManifestConfig;
import app.HTTPRequest;

component
    accessors=true
    displayname = 'SecurityService'
    extends = 'app.Service'
{

	property Any security;
	property name = 'defaultRule' default = 'IS_AUTHENTICATED_ANONYMOUSLY';

	public Any function autorizationRequest(ManifestConfig mContext)
	{

		// parse if it request of the type rest
		var itRequestValidateEqualsRest = (mContext.getRouting().getBundleManifest().getDefineScenario() == 'DEFAULT' ? mContext.getRouting().getBundleManifest().getDefineScenario() : 
														mContext.getContainer().getComponent('restfull').parseRequest(mContext)); 

		if(itRequestValidateEqualsRest == true){
			setDefaultRule('ROLE_OAUTH');			
		}

		var userSession = getContainer().getBundle('user').getService('userSession').getUser();

		var routeAccess = validateRouteAccess(mContext.getBindRequest(), userSession);

		mContext.getBindRequest().setBlPermission(routeAccess);

		if(routeAccess == false){

			if(itRequestValidateEqualsRest == true){

				throw(getContainer().getComponent('tag').tag('request.validate.notauthorized'), 403);
			}

			mContext.getBindRequest().redirect(getBundleAlias(security), getBundleController(security), getDefaultLogin(security));
		}

		return this;
	}

	public boolean function validateRouteAccess(HTTPRequest mRequest, any userSession)
	{

		// load file yaml
		var security = getContainer().getBundle('user').getService('security').load(); setSecurity(security);

		// if anonymous, permission acepted
		if(getPermissionAnonymous(security) == true){
			return true;
		}

		// buscar rule do usuario
		var userRule = parseRuleByUser(userSession);

		// find rule in route
		var roleRequest = parseRuleRoute(mRequest);

		// permission access
		var permission = false;

		for(ruleItem  in userRule){

			if(ArrayContains(roleRequest, ruleItem)){

				// permited access
				permission = true;

				break;
			}
		}

		return permission;

	}

	public any function parseRuleRoute(any mRequest)
	{

		// validate evento access to user in router
		var bundle = mRequest.getStBundle();

		var controller = mRequest.getStEvent();

		var action = mRequest.getStAction();

		var permissionRules = getAccessControlEvent(getSecurity(), bundle, controller, action);

		if(ArrayLen(permissionRules) < 1){
			permissionRules = ['IS_AUTHENTICATED_ANONYMOUSLY'];
		}

		return permissionRules;

	}

	public array function parseRuleByUser(any user)
	{

		if(!isDefined("user") or structCount(user) == 0){
			return [getDefaultRule()];
		}

		if(structKeyExists(user,"rule")){

			var rules = [];

			for(single in user['rule']){
				arrayAppend(rules, single.getStName());
			}

			if(ArrayLen(rules) == 0){
				return [getDefaultRule()];
			}

			return rules;
		}

		return [getDefaultRule()];
	}

	public array function getAccessControlEvent(struct security,String bundle, String event, String action)
	{

		for (single in security['security']['access_control_event']){

			if( LCase(single['bundle']) == LCase(bundle) and
				LCase(single['event'])  == LCase(event)  and
				LCase(single['action']) == LCase(action)){

				return single['role'];
			}
		}

		return [];

	}

	public String function getBundleAlias(struct security)
	{
		return security['security']['bundle_alias'];
	}

	public String function getBundleController(struct security)
	{
		return security['security']['controller'];
	}

	public boolean function getPermissionAnonymous(struct security)
	{
		return security['security']['firewalls']['anonymous'];
	}

	public String function getRoutDefaultRedirect(struct security)
	{
		return security['security']['firewalls']['root_path'];
	}

	public String function getDefaultLogin(struct security)
	{
		return security['security']['firewalls']['path_login'];
	}

	public struct function load()
	{
		return getMContext().getComponent('yaml').getConfig('security');
	}

	public String function parseTokenPassw(String passw)
	{
		return Hash(passw, MD5);
	}

}







