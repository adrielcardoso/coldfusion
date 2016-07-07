/**
* @Comment
* 
* Configuration.cfc definido para controlar configurações futuras, nesse primeiro momento não está gerenciando nenhum processo.
* 
* */

component
	accessors = true
    displayname = 'Configuration'
{

	public void function init()
	{
		var base = CreateObject("component","app.BaseController").init();
	}

}







