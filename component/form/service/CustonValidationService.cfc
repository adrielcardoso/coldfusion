import app.ManifestConfig;
import app.Component;

component
    displayname = 'CustonValidationService'
    extends = 'Component'
{


	public boolean function validateCpf(String stCpf)
	{

		writeDump("validando CPF #stCpf#");

		abort;

	}

}