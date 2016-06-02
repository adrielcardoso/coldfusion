component
	output = 'false'
    displayname = 'UserService'
    extends = 'config.Service'
{

	public void function init()
	{
		writeDump('CFSiteBundle: service de user');
		abort;
	}


	public boolean function  createUser()
	{

		writeDump('Analisando criacao de usuario');
		abort;
	}

}







