component
    displayname = 'MainController'
    extends = 'BaseController'
{

	public void function init()
    {
        writeDump('objecto do tipo Main, default');
        abort;
    }

    public String function parseDefault(){
    	return '';
    }
} 

