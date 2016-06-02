/**
*@hint "Componente responsável por gerenciar a criação de objetos singleton no escopo persistente (application)"
*/
component displayname="factory" {

	/* :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */

	public any function init() hint="Construtor da classe" {
		variables.instance = {};

		return this;
	}

	/* :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */

	public any function getBean( required String name ) hint="Cria os objetos Bean/VO NÃO singleton" {
		return createInstance( arguments.name );
	}

	/* :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */

	public any function getInstance( required String name ) hint="Cria e inicializa os objetos" {
		// lista dos Beans que não podem ser Singleton
		var listBean = "";

		// Bean não é singleton
		if ( ListFindNoCase(listBean , arguments.name) ) {
			return createInstance( arguments.name );
		}

		// Verifica se a instancia já foi carregada, caso contrário cria a instancia do objeto
		if ( not StructKeyExists(variables.instance, arguments.name) ){
			variables.instance[ arguments.name ] = createInstance( arguments.name );
		}

		return variables.instance[ arguments.name ];
	}

	/* :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: */

	private any function createInstance( required String name ) hint="Cria a instancia da classe" {
		switch( arguments.name )
		{
			case "AlaturService":
				return CreateObject( "component", "app.componentes.services.AlaturService" ).init();
				break;
		}
	}

	public any function dump( ) hint="Exibe o dump com os objetivos instanciados" {
		writeDump(variables);
		abort;
	}
}