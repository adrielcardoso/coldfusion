component
    output = 'false'
    displayname = 'LayoutController'
{

    public void function view(String fileName, Array args = [])
    {
        writeDump(args);
        abort;
    }

} 

