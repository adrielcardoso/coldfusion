import app.HTTPRequest;
import app.HTTPResponse;
import app.ManifestConfig;

/**
* @Comment
* 
* Componente para tratamento de erro e definição do roteamento de status 
* 
* para cada tupo de erro definido no status code da requisição
* 
* os layouts utilizados para gestão de erro, fica disponivel em 
* 
* component.template.error
* 
* */

component
	accessors = true
    displayname = 'ErrorController'
    extends = 'BaseController'
{

	property Routing routing;

	public ErrorController function init(Routing routing)
    {
		setRouting(routing);

		return this;
	}


    /**
    * @Comment 
    * 
    * metodo do tipo Void, onde os parametros de entrada é apenas mensagem e status do erro,
    * 
    * para um entendimento caso o tipo de request for diferente de serializado o controlador tentara achar 
    * 
    * uma view em component.template.error com a nomenclatura 'error{statusCode}.cfm', caso for informado por query string 
    * 
    * o parametro de responsetype, o retorno sera no formato solicitado.
    * 
    * */
    public void function error(String message, String status = false)
    {

        if(getRouting().getContext().getRequest().getResponseType() != ''){

            var responseComponent = getRouting().getContext().getComponent('response');

            responseComponent.out({'message' : message, 'status' : status}, getRouting().getContext().getRequest());

        }else{

        	data = {
        		'template' : '/component/template/error/#(!status ? 'error' : 'error#status#')#.cfm',
        		'load' : createObject("component", 'app.TemplateInflate').init(getRouting())
        	};

        	include '/component/template/#getRouting().getBundleManifest().getTemplate()#.cfm';
        }

    }

}

