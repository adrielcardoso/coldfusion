import component.orm.*;
component extends = "config.Entity" accessors=true persistent=true table="profile" {

	property name="id" column="id" generator="increment";
	property name="name" column="name";
	property name="userId" column="user_id";
	property name="user" fieldtype="many-to-one" fkcolumn="id" cfc="UserEntity" insert=false update=false; //* @missingRowIgnored true

	public ProfileEntity function init(){
		super.init();
		return this;
	}
}