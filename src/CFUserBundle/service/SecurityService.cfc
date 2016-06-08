import app.ManifestConfig;
import app.HTTPRequest;

component
    accessors=true
    displayname = 'SecurityService'
    extends = 'app.Service'
{

	property Any security;

	public void function autorizationRequest(ManifestConfig mContext)
	{

		var userSession = getContainer().getService('UserSession').getUser();

		var routeAccess = validateRouteAccess(mContext.getBindRequest(), userSession);

		mContext.getBindRequest().setBlPermission(routeAccess);

		if(routeAccess == false){

			mContext.getBindRequest().redirect(getBundleAlias(security), getBundleController(security), getRoutDefaultRedirect(security));
		}

	}

	public boolean function validateRouteAccess(HTTPRequest mRequest, any userSession)
	{

		// load file yaml
		var security = getMContext().getService('security').load(); setSecurity(security);

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

		return getAccessControlEvent(getSecurity(), bundle, controller, action);

	}

	public array function parseRuleByUser(any user)
	{

		if(user == false){
			return ['IS_AUTHENTICATED_ANONYMOUSLY'];
		}

		// var tempUser = {
		// 	'name' : 'Adriel Cardos',
		// 	'rule' : ['IS_AUTHENTICATED_ANONYMOUSLY']
		// };

		return user['rule'];
	}

	public array function getAccessControlEvent(struct security,String bundle, String event, String action)
	{

		for (single in security['security']['access_control_event']){


			if(single['bundle'] == bundle and single['event'] == event and single['action'] == action){
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
		return security['security']['firewalls']['route_main'];
	}

	public struct function load()
	{
		return getMContext().getComponent('yaml').getConfig('security');
	}

}







