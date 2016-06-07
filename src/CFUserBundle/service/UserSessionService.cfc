component
    displayname = 'UserSessionService'
    extends = 'app.Service'
{

	public any function getUser()
	{

		if(StructKeyExists(Session, "user")){

			return StructFindKey(Session, 'user');
		}

		return false;
	}

	public struct function setUser(struct user)
	{

		StructInsert(Session, 'user', user);

		return getUser();
	}

}







