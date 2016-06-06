import component.orm.*;
import config.*;

component
{

	property name="model" type="Entity";

	public Entity function findByPk(pk){
		try {
			beforeFind();
			var m = EntityLoadByPK(getEntityName(), pk);
			m.init();
			m = afterFind(m);
		}
		catch(any e) {
			rethrow;
		}
		
		// writeDump(m);abort;
		return m;
	}

	public Entity function findByAttributes(attr, unique = true, options){
		try {
			beforeFind();
			var queryOptions = structKeyExists(arguments, "options") ? arguments.options : {maxResults:1};
			var m = EntityLoad(getEntityName(), attr, unique, queryOptions);
			m.init();
			m = afterFind(m);
		}
		catch(any e) {
			rethrow;
		}
		
		return m;
	}



	private function beforeFind(){}
	private function afterFind(entity){
		return arguments.entity;
	}
	
	public DataProvider function search(Criteria criteria, Struct paginationOptions){
		dataProvider = new DataProvider();
		dataProvider.setCriteria(arguments.criteria);
		dataProvider.setPagination(new Pagination(arguments.paginationOptions));
		return dataProvider;
	}

	public boolean function validate (){
		return true;
	}

	public boolean function beforeValidate (){
		return true;
	}

	public boolean function afterValidate (){
		return true;
	}

	public Entity function save (Entity model){
		try {
			if(this.validate()){
				var m = beforeSave(arguments.model);
				EntitySave(m);
				afterSave(m);
				ormflush();
			} else {
				// TODO: throw validation errors
			}
			return this;
		} catch(any e) { 
			rethrow;
		} 
	}

	private function beforeSave(model){
		return arguments.model;
	}
	private function afterSave(model){
		return arguments.model;
	}

	string function getPrimaryKey(){

	}
}

 


		 


