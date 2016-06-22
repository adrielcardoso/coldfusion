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

