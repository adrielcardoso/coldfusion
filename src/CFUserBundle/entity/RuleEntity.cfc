
component
    entityname = 'RuleEntity'
    extends = 'app.Entity'
    table="Rule"
    displayname = 'RuleEntity'
    persistent="true"
    accessors = "true"
{
    property name = 'id' column="id_rule" generator="increment" ormtype="integer";

    property name = 'stName' column="st_name" ormtype="string";

    property name = 'user' type="UserEntity" fieldtype="many-to-one" fkcolumn="userID" cfc="UserEntity";
}

