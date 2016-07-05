component
	accessors = true
    displayname = 'BundleManifest'
    extends = 'app.ManifestConfig'
{

    property String template;
    property String bundleName;
    property name = 'defineScenario' default = 'DEFAULT';

	public BundleManifest function init(String bundleName)
    {

        setTemplate('default.template');
        // setTemplate('bootstrap.template');

        setDefineScenario('REST');

        setBundleName(bundleName);

        return this;
    }

}

