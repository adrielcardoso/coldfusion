component
    displayname = 'UserAutenticateService'
    extends = 'app.Service'
{

	public boolean function parseLogin(String st_email, String st_passw)
	{

		var ormService = getContainer().getComponent('orm');

        // writeDump(ormService.insert(userEntity));
        var status = ormService.findByQuery('select count(*) from UserEntity where stEmail = ? and stPassword = ?', [st_email, st_passw]);

        if(isArray(status) and arrayLen(status) > 0){
        	return (status[1] == 0 ? false : true);
        }

        return false;

	}

}







