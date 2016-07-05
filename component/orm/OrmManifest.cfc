import component.ManifestComponent;
import app.Entity;
import src.*;

component
	accessors = true
    displayname = 'OrmManifest'
    extends = 'app.ORMController'
{

	public boolean function insert(Entity entity)
	{
		try{
			EntitySave(entity);
			return true;
		}catch(Any e){

			writeDump(e.getMessage());

			return false;
		}
	}

	public any function findByQuery(required String query, any params, any definitions)
	{

		try{

			if(!isDefined("params")){
				params = false;
			}

			if(!isDefined("definitions")){
				definitions = false;
			}

			return ORMExecuteQuery(query, params, definitions);

		}catch(Any e){

			rethrow;
		}

	}


}

