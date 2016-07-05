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

	public any function findRuleByUserId(app.Entity userEntity)
	{

		var response = [];

		if(isArray(userEntity.getRules())){

			for(single in userEntity.getRules()){
				arrayAppend(response, single);
			}
		}

		return response;
	}

	public array function createRuleRawUser(any userEntity)
	{

		try{

			var ruleEntity[1] = createRule(userEntity, 'IS_AUTHENTICATED_ANONYMOUSLY');
			var ruleEntity[2] = createRule(userEntity, 'ROLE_USER');
			// var ruleEntity[3] = createRule(userEntity, 'ROLE_ADMIN');

			return ruleEntity;

		}catch(Any e){
			rethrow;
		}

	}

	public any function createRule(any userEntity, String namePermission)
	{

		var ruleEntity = getContainer().getEntity('rule');

		ruleEntity.setStName(namePermission);
		ruleEntity.setUser(userEntity);

		EntitySave(ruleEntity);

		return ruleEntity;

	}

}







