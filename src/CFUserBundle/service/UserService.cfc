import component.orm.*;
component
    extends = 'app.Service'
    accessors=true
{

	property name="entityName" default="UserEntity";

	public DataProvider function search(Criteria criteria, Struct paginationOptions){
		arguments.criteria = arguments.criteria ?: new Criteria(getEntityName());
		// criteria.setFields('new map(t.id as id, t.name as name)');
		criteria.setCount('COUNT(t.id)');
		criteria.setJoin('LEFT JOIN t.profile p');
		criteria.compare('t.name', '%Rodrigo%', true); // terceiro parametro true para utilizar LIKE '%{params}%', ou false para = {param}
		// criteria.addCondition('birthdate >= :birthdatemin', { 'birthdatemin':'2016-05-30' });
		criteria.setOrder('t.id','DESC');
		return super.search(arguments.criteria, structKeyExists(arguments,'paginationOptions') ? arguments.paginationOptions : { pageSize : 10 });
	}

	private function afterFind(entity){
		var formatBirthdate = DateFormat(entity.getBirthdate(),"dd/mm/yyyy");
		entity.setBirthdate(formatBirthdate);
		return entity;
	}

	private function beforeSave(entity){
		var formatBirthdate = DateFormat(entity.getBirthdate(),"yyyy-mm-dd");
		entity.setBirthdate(formatBirthdate);
		return entity;
	}

}







