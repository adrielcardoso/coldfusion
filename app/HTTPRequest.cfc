import app.ManifestConfig;

/**
* 
* @Comment 
* 
* Componente para definição de dados de entrada, ou seja 
* os parametros solicitado no request sera tratado por esse contexto para referencia 
* de novas nalises.
* 
* */

component
    accessors = true
    displayname = 'HTTPRequest'
    extends = 'ManifestConfig'
{

    property String stBundle;
    property String stEvent;
    property String stAction;
    property boolean blPermission;
    property String method;
    property struct args;
    property int statusCode;
    property String message;
    property String responseType;

    /**
    * 
    * @Comment 
    * 
    * Realizar mapeamento de parametros do request, buscando informações de /Bundle/Controller/Action
    * Quando não existir, por padrão será definido parametros default, nomeados como main e ação contrutora init().
    * 
    * */
    public HTTPRequest function bindRequest()
    {

        /**
        * 
        * Mapeamento de query string /bundle/controller/action e variavel query string reservada para tipo de resposta 
        * 
        * OBS: para retornar requisição de um controlador diferente de REST, a qualquer momento pode ser solicitado por parametro de 
        *      query string a variavel 'responsetype=json', sendo assim o saida da requisição sera no formato json, sem analise de CORS 
        * 
        * */
        setStBundle(getKey('bundle') == '' ? 'main' : getKey('bundle'));
        setStEvent((getKey('event') == '' ?  'main' : getKey('event')));
        setStAction((getKey('action') == '' ? 'init' : getKey('action')));

        /**
        * 
        * parametro adicional, caso retorno de dados seja necessário serializar 
        * 
        * */
        setResponseType(LCase(getKey('responsetype')));

        setMethod(CGI.REQUEST_METHOD);

        /**
        * 
        * antes que a validação seja feita por security:autorizationRequest, por padrão é definido como requisição não autorizada.
        * 
        * */
        setBlPermission(false);

        /**
        * 
        * 
        * */
        // setMessage('ocorreu algum problema ao tentar acessar essa página, verifique com o administrador do sistema');

        return this;
    }


    /**
    * 
    * @Hint Buscar parametro de query string 
    * 
    * @attributeQueryString nome da variavel passada por query string 
    * 
    * */
    public String function getKey(String queryString)
    {
        return (IsDefined("URL.#queryString#") ? evaluate("URL.#queryString#") : '');
    }


    /**
    * 
    * @Hint validação do verbo definido para entrada no request, POST, GET, DELETE, PUT ...
    * 
    * @attributeTypeRequest nome do verbo para validação 
    * 
    * */
    public boolean function isRequest(String typeRequest)
    {
         return (typeRequest == getMethod() ? true : false);
    }


    /**
    * @Comment 
    * 
    * metodo para redirecionamento de requisição, ou seja os parametros necessarios corresponde 
    * a uma nova requisição seguindo a definição de /bundle_alias/controller_name/action_name 
    * 
    * */
    public void function redirect(String bundle = 'main', String controller, String action = false, struct arg = {})
    {

        var args = '';
        if(!StructIsEmpty(arg)){
            for (item in StructKeyArray(arg)){
                args &= '&#item#=#arg[item]#';
            }
        }

        location(application.basedir&"?bundle=#bundle#&event=#controller#" & (action != false ? '&action=#action#' : '') & args, false);
    }

    /**
    * 
    * @Comment 
    * 
    * redirecionamento sem parametros adicionais apenas para definição do alias do Bundle 
    * 
    * ou seja http://localhost/bundle_name ou quando parametro for vazio, refirecionara para http://localhost
    * 
    * */
    public void function redirectRoot(String name)
    {
        location(application.basedir & (isDefined('name') and len(name) > 0 ? name : ''), false);
    }


    /**
    * 
    * @Hint este metodo retorna a criação de uma URL
    * 
    * */
    public String function createUrl(String bundle, String controller, String action)
    {
        return application.basedir&"?bundle=#(isDefined('bundle') ? bundle : 'main')#&event=#(isDefined('controller') ? controller : 'main')#" & (isDefined('action') ? '&action='&#action# : '');
    }


    /**    
    * 
    * @Hint metodo responsavel por verificar se no objeto do controller existe no metodo que está tentando ser acessado
    * 
    * */
    public String function validateMethod(app.BaseController controller, String method)
    {   

       for(single in getMetaData(controller).FUNCTIONS){

            if(Trim(LCase(single.NAME)) == Trim(LCase(method))){

                if(StructKeyExists(single, 'METHOD')){

                    if(!isRequest(single.METHOD) and validateMethodPermited(single.METHOD)){

                        throw('method #method# defined how ' & ToString(single), 500);
                    }

                }

            }

        }

        return method;
    }


    /**
    * 
    *   @Comment 
    * 
    *   analise do verbo que está definido sobre a função, ou seja caso a função for diferente 
    *   do tipo de requisição sera lançado uma exceção 
    * 
    *   OBS: Só sera validado esse cenário caso for definido explicitamente sobre a função 
    *        o tipo de verbo que pode ser solicitado.
    * 
    *   Ex:  
    *           /**
    *            * \\@Method POST
    *            **
    *            Any function methodExemple(Any any){};
    * 
    * */
    public boolean function validateMethodPermited(String nameMethod)
    {

        var methods = [
            'GET', 'POST', 'DELETE', 'PUT'
        ];

        for(single in methods){
            
            if(trim(LCase(single)) == trim(LCase(nameMethod))){
                return true;
            }

        }

        throw('Method #nameMethod# no suported in request', 500);

    }

}

