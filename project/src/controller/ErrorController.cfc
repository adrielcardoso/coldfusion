component
    displayname = 'ErrorController'
    extends = 'BaseController'
{

	public void function init(){}

    public void function error(String message, String status){

        writeDump('EXCEPTION ERRORR: '&message & ' :' & status);
        abort;
    }
} 

