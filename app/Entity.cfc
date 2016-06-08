component
	accessors = true
    displayname = 'Entity'
    extends = 'ManifestConfig'
{

	public any function getForm(Entity entity)
    {
    	writeDump(entity);abort;
    }

}