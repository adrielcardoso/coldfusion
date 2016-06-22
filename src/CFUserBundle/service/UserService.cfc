component
    displayname = 'UserService'
    extends = 'app.Service'
{

	public any function findUserByEmail(String st_email)
	{

		var ormService = getContainer().getComponent('orm');

        // return first user by email and defined of email is unique in platform
        return ormService.findByQuery('from UserEntity where stEmail = ?', [st_email])[1];

	}

	public any function findRuleByUserId(numeric idUser)
	{

		var ormService = getContainer().getComponent('orm');

        // return first user by email and defined of email is unique in platform
        return ormService.findByQuery('from RuleEntity where idUser = ?', [idUser]);

	}


}







