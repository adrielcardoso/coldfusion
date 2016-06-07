component
	accessors = true
    displayname = 'Entity'
{

	property name="meta";
	property name="isNewRecord" type="boolean" default=true;

	public Entity function init(){
		this.meta = getMetadata(this);
		return this;
	}

	string function getPrimaryKey(){
		var key='';
		for (prop in this.meta.properties) {
			if(StructKeyExists(prop, "generator")) {
				key = prop.column;
				break;
			}
		}
		return key;
	}
}