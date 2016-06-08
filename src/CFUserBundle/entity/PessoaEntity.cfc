component
    accessors = true
	displayname = 'PessoaEntity'
    extends = 'app.Entity'
{

    property String stFullName;
    property String stEmail;
    property String stPassw;

    public Entity function pessoaEntity(String stFullName, String stEmail, String stPassw)
    {
        setStFullName(stFullName);
        setStEmail(stEmail);
        setStPassw(stPassw);

        return this;
    }

}

