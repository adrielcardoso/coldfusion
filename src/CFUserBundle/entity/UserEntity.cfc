
component
    entityname = 'UserEntity'
    extends = 'app.Entity'
    table="User"
    displayname = 'UserEntity'
    persistent="true"
    accessors = "true"
{

    property name = 'id'  column="id" generator="increment" ormtype="integer";
    property name = 'stFullName' column="st_full_name" ormtype="string";
    property name = 'stEmail' column="st_email" ormtype="string";
    property name = 'stPassword' column="st_passw" ormtype="string";

    public Entity function userEntity(String stFullName, String stEmail, String stPassword)
    {
        setStFullName(stFullName);
        setStEmail(stEmail);
        setStPassword(stPassw);
        return this;
    }

}

