/**
* 
* @Comment 
* 
* esse contexto define o gerenciamento de componentes que podem extender o ORM
* 
* componente responsavel por relação com ORM, está em app.orm
* 
* */

component
	accessors = true
    displayname = 'ORMController'
    extends = 'Component'
{

	property Any context;

	public Any function init(Any context)
	{

		setContext(context);

		return this;
	}

}

