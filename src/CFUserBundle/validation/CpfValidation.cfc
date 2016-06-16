import app.ManifestConfig;

component
	accessors = true
    displayname = 'CpfValidation'
    extends = 'app.ValidationManifest'
{

	public struct function cpfValidation()
	{

		// getContainer().getService('user')

		return {'status' : false, 'message' : getTag().translater(field, 'validateCpf')};
	}

}