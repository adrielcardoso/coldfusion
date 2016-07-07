import app.ManifestConfig;
import app.BaseController;

/**
* 
* @Comment
* 
* HTTPResponse é um recurso para manipulação de objetos para saida, ou seja 
* Esse controlador permite fazer analise e definir recursos para o controlador conseguir passar os parametros 
* para a saida de dados.
* 
* */

component
	accessors = true
    displayname = 'HTTPResponse'
    extends = 'ManifestConfig'
{

	property HTTPResponse httpResponse;
    property HTTPRequest httpRequest;
	property threadMain;
    property stThreadName;
    property Routing routing;

    /**
    * 
    * @Comment 
    * 
    * inicializar parametros de contexto base, para acesso a recursos de origem 
    * e definição das orienteções de parametros sendo definidas nesse contexto.
    * 
    * */
	public HTTPResponse function init(BaseController mContext, String stThreadName, Routing routing)
	{
		setThreadMain(mContext);
		setStThreadName(stThreadName);
		setRouting(routing);
        setHttpResponse(this);

		return this;
	}


    /**
    * 
    * @Comment 
    * 
    * Responsabilidade de retornar dados orientados a saida, todos os eventos que precisarem acessar esse recurso 
    * será validado caso seja um parametro para acesso a uma View ou quando o responsetype for passado por query string, os formatos aceitos até o 
    * momento estão para json 
    * 
    * Ex: localhost/?responsetype=json, esse request sera respondido por padrão no formato JSON.
    * 
    * Quando não informar o formato de resposta em responsetype, o contexto tentara acessar a view que pertence ao controller de origem 
    * 
    * */
    public void function view(String fileName, struct data)
    {

        if(getHttpRequest().getResponseType() != ''){

            var responseComponent = getThreadMain().getContainer().getComponent('response');

            responseComponent.out(data, getHttpRequest());
        }else{

            /**
            * a variavel DATA está disponivel para acesso em qualquer lugar dentro da View.
            * */
            StructAppend(data, {
                'template' : '#getRouting().getBundleRequestMain()#view/#getStThreadName()#/#fileName#.cfm',
                'load' : createObject("component", 'app.TemplateInflate').init(getRouting()),
                'form' : createObject("component", 'component.form.FormManifest'),
                'req'  : getHttpRequest()
            });

        	include '/component/template/#getRouting().getBundleManifest().getTemplate()#.cfm';
        }

    }

}

