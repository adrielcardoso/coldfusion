component
	accessors = true
    displayname = 'ORMController'
    extends = 'Component'
{

	property Any context;

	public Any function init(Any context)
	{
		/*
			set it request of will get containers
		*/
		setContext(context);

		// before();

		return this;
	}

	// public any function before()
	// {
	// 	writeDump('before');
	// }

	// public any function after()
	// {
	// 	writeDump('after');
	// }

}

