component
    displayname = 'UserSessionService'
    extends = 'app.Service'
    accessors = true
{

	property name='sessionKeyUser' default='user_session';

	public struct function getUser()
	{
		try{

			// writeDump(Session.user_session);
			// abort;

			return Session.user_session;
		}catch(Any e){
			return {};
		}
	}

	public struct function setUser(struct user)
	{

		if(structKeyExists(Session, getSessionKeyUser())){
			StructDelete(Session, getSessionKeyUser());
		}

		StructInsert(Session, getSessionKeyUser(), user);

		return getUser();
	}

}







