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

        // return rules of the user by e-mail
        return ormService.findByQuery('from RuleEntity where idUser = ?', [idUser]);

	}

	public array function createRuleRawUser(numeric idUser)
	{

		try{

			var ruleEntity[1] = createRule(idUser, 'IS_AUTHENTICATED_ANONYMOUSLY');
			var ruleEntity[2] = createRule(idUser, 'ROLE_USER');

			return ruleEntity;

		}catch(Any e){
			rethrow;
		}

	}

	public any function createRule(numeric idUser, String namePermission)
	{

		var ruleEntity = getContainer().getEntity('rule');

		ruleEntity.setIdUser(idUser);
		ruleEntity.setStName(namePermission);

		EntitySave(ruleEntity);

		return ruleEntity;

	}

}







