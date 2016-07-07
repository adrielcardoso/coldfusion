/**
* @Comment 
* 
* responsavel por buscar view dentro de um determinado bundle 
* 
* cenario para exemplo: deve ser buscar uma view de menu, dentro de uma view de cadastro, para isso 
* 
* deve se utlilizar esse recurso, automaticamente esse contexto ja está disponivel na variavel DATA dentro da view,
* 
* ex: chamada de uma view específica.
* 
*   data['load'].view('diretorio/nome_view', {});
* 
* */

component
	accessors = true
    displayname = 'TemplateInflate'
{

    property Routing routing;

    public TemplateInflate function init(Routing routing)
    {
        setRouting(routing);

        return this;
    }

    public function view(String nameView, any data)
    {
        include '#getRouting().getBundleRequestMain()#view/#nameView#.cfm';
    }

}

