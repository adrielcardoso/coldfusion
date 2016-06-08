
component
    accessors = true
	displayname = 'UserEntity'
    extends = 'app.Entity'
{

    property String stFullName;
    property String stEmail;
    property String stPassw;

    public Entity function userEntity(String stFullName, String stEmail, String stPassw)
    {
        setStFullName(stFullName);
        setStEmail(stEmail);
        setStPassw(stPassw);

        return this;
    }

}

