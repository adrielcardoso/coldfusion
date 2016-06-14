
component
    accessors = true
	displayname = 'UserEntity'
    extends = 'app.Entity'
{

    property String stFullName;
    property String stEmail;
    property String stPassword;

    public Entity function userEntity(String stFullName, String stEmail, String stPassword)
    {
        setStFullName(stFullName);
        setStEmail(stEmail);
        setStPassword(stPassw);

        return this;
    }

}

