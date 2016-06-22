
component
    entityname = 'RuleEntity'
    extends = 'app.Entity'
    table="Rule"
    displayname = 'RuleEntity'
    persistent="true"
    accessors = "true"
{

    property name = 'id'  column="id" generator="increment" ormtype="integer";
    property name = 'idUser' column="id_user" ormtype="integer";
    property name = 'stName' column="st_name" ormtype="string";

}

