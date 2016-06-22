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

	public any function findByQuery(required String query, required array params)
	{
		try{
			return ORMExecuteQuery(query, params);
		}catch(Any e){
			rethrow;
		}
	}


}

