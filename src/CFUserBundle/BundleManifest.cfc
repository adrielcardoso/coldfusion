component
	accessors = true
    displayname = 'BundleManifest'
    extends = 'app.ManifestConfig'
{

    property String template;
    property String bundleName;

	public BundleManifest function init(String bundleName)
    {

        setTemplate('default.template');
        // setTemplate('bootstrap.template');

        setBundleName(bundleName);

        return this;
    }

}

