component
	accessors = true
	output = 'false'
    displayname = 'Configuration'
{

	public void function init()
	{
		
		mainController = CreateObject("component","src.controller.MainController");


		parse = mainController.parseRequest();

		writeDump(parse);
	}

}

 


		 


