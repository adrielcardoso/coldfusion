component
	output = 'false'
    displayname = 'UserService'
    extends = 'app.Service'
{

	public void function init()
	{
		writeDump('CFSiteBundle: service de user');
		abort;
	}


	public boolean function  findByPk(int id)
	{


			user = getContainer().getEntity('user').findByPk(id);



	}


}







