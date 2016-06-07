import component.orm.*;
component
	extends = "app.Entity"
	accessors=true
	persistent=true
	table="user" {

	property name="id" column="id" generator="increment";
	property name="name";
	property name="username" column="username";
	property name="pass" column="pass";
	property name="type" column="type";
	property name="birthdate" column="birthdate";
	property name="profile" fieldtype="one-to-many" fkcolumn="user_id" cfc="ProfileEntity" missingRowIgnored=true  cascade="all-delete-orphan";

	public UserEntity function init(){
		super.init();
		return this;
	}
}
