
import app.HTTPRequest;
import app.HTTPResponse;
import app.Routing;

/**
*
*   @Comment
* 
*   BaseController.cfc 
*   define a gestão de permissões, validação de roteamento e manipulação de objetos de entrada e saída 
*   para todas requisições.
* 
* */
component
	accessors = true
    displayname = 'BaseController'
    extends = 'app.ManifestConfig'
{

    property HTTPRequest bindRequest;
    property HTTPResponse httpResponse;
    property Container mContainer;
    property Routing routing;
    property errorController;

    /**
    * 
    * @Hint inicializa aplicação 
    * 
    * */
    public void function init()
    {

        try{


            /**
            * 
            * chamando metodo para definições antes de qualquer tipo de analise 
            * 
            * */
            parseBefore();
            

            /**
            * 
            * Set objectos com definições de request 
            * 
            * */
            setBindRequest(CreateObject("component", 'HTTPRequest').bindRequest());
        
            setMContainer(getContainer(this));

            setRouting(getMContainer().getRouting());

            setErrorController(CreateObject('component', 'ErrorController').init(getRouting()));


            /*---------------------------------*/

            
            /**                
            * 
            *   analise de roteamento, para verificar se usuário tem permissão de acesso para determinado contexto.
            *   caso não, o object 'getBindRequest().getBlPermission()' retornara como FALSE, logo caindo da condição 
            *   do gerenciador de erros.
            * 
            * */
            getMContainer().getBundle('user').getService('security').autorizationRequest(this);



            /**    
            * 
            *   se usuario tiver permissão de acesso, a validação de request retornara essa condição como verdadeiro 
            * 
            * */
            if(getBindRequest().getBlPermission()){


                /**
                *   
                * Criando object de controller a partir dos valores definidos no roteamento de request.
                * 
                * Os parametros de acesso são definidos por /bundle/controller/action - por query string quando GET pode ser enviado novos parametros 
                * 
                * Caso alguma das informações do request não serem validas automaticamente será lançado uma exceção para o gestor de Errors
                * 
                * */
                var mContext = createObjectByName(getBindRequest().getStEvent() , 'controller', getRouting().getBundleRequestMain());


                /**
                * 
                * injetando container para novo contexto de aplicação 
                * 
                * */
                mContext.setMContainer(getMContainer());


                /**
                * 
                *   Para todos os controller, existe uma entrada e saída, logo todo request será validado e também tera um 
                *   recurso para definições de saída, esse contexto se chama HTTPResponse.
                * 
                * */
                httpResponse = createObject("component", 'HTTPResponse').init(mContext, LCase(getBindRequest().getStEvent()), getRouting());


                /**
                * 
                *   HTTPResponse necessita do recurso de objetos de request para implementação  
                * 
                * */
                httpResponse.setHttpRequest(getBindRequest());


                /**    
                * 
                *   Analisando se a 'Action' no controller existe, caso não será realializado uma exeção com 404
                * 
                * */
                var involeMethod = getBindRequest().validateMethod(mContext, (getBindRequest().getStAction() == 'actionInit' ? 'actionInit' : 'action#parseNameDir(getBindRequest().getStAction())#'));
                if(!StructKeyExists(mContext, involeMethod)){

                    /**
                    *   Buscando componente para orientação de tradução na plataforma 
                    * */
                    var translater = getContainer().getComponent("tag");


                    throw(translater.tag('request.method.notfound'), 404);
                }



                /**
                *   
                *   Até esse momento todos os parametros de validação estão coerente com todos os requisitos 
                * 
                *   então, realizando chamada da 'Action' no contexto da aplicação requisitado 
                * 
                *   Para mapeamento de entrada e saída dentro do Controller, todas as chamadas de requisições Obrigatoriamente passara 
                * 
                *   por uma Action que pertence a um Controlador.
                * 
                *   Essa definição também também exige que toda Ação recebera por parametro um objeto de HTTPRequest e HTTPResponse
                * 
                * 
                * */
                invoke(mContext, involeMethod, {
                            'req' = getBindRequest(),
                            'res' = httpResponse
                });


            }else{


                /**
                * 
                *   Gestão controladora de exceção para eventualidades de solicitação invalida 
                * 
                * */

                getErrorController().error(getBindRequest().getMessage(), getStatusCode());

            }


            /**
            * 
            *   Chamada do ultimo metodo após processo realizado, finalizado o ciclo de vida da aplicação
            * 
            *   OBS: O Ciclo de vida somente será concluido quando não existir exceções 
            * 
            * */
            getMContainer().parseAfter();


        }catch(Any e){

            /**
            * 
            *   definição de mensagem com fatal error para gestor de Erros 
            * 
            * */
            getErrorController().error(e.message, 500);
        }

    }


    /**    
    * 
    *    @Comment
    * 
    *    Method Generico para criação de objectos independente de qual bundle pertence 
    * 
    * */
	public BaseController function createObjectByName(required String stEvent, String stDirObject = 'controller', required String bundle)
    {
       return CreateObject("component",  bundle & LCase(stDirObject) &  "." &this.parseNameDir(stEvent)  &  this.parseNameDir(stDirObject)  );
    }


    /**
    * 
    * 
    * @Comment
    * 
    * Gestor do retorno do Objecto de Container para auxilio entre outros contexto
    * 
    * Por padrão, todos os objectos a partir do BaseController.cfc poderá buscar recursos apenas 
    * 
    * solicitando para o Container, ou seja, para buscar um Component, Entity, Service ou outros deve ser realizado da seguinte forma 
    * 
    *   -- getContainer().getComponent('alias_component'), getContainer().getService('alias_service')
    * 
    *   Caso não tiver no mesmo bundle, deve ser aplicado da seguinte forma:
    * 
    *   -- getContainer().getBundle('alias_bundle').getComponent('alias_component')
    *   
    * 
    *  @attributeManifestConfig  referencia de contexto principal, serve para retorno de container, quando existir 
    * 
    * */
    public Container function getContainer(ManifestConfig manifestConfig)
    {

        if(!isDefined('manifestConfig')){

            finish(getMContainer());

            return getMContainer();
        }

        var generateContainer = createObject("component", 'app.Container');


        return generateContainer.parseContainer(manifestConfig);

    }

}
