component
	output = 'false'
    displayname = 'UserService'
    extends = 'app.Service'
{

	public boolean function  findByPk(int id)
	{


			user = getContainer().getEntity('user').findByPk(id);



	}


}







