component
	accessors = true
    displayname = 'BundleManifest'
    extends = 'config.ManifestConfig'
{

    property template;

	public BundleManifest function init()
    {
        setTemplate('default.template');

        return this;
    }
    
} 

