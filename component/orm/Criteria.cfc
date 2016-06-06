import app.base.*;

component accessors=true {

	property entityName;
	property buildString;
	/**
	* @type string
	* @hint text
	* @default t
	*/
	property fields;
	/**
	* @type string
	*/
	property distinct;
	/**
	* @type string
	*/
	property join;
	property order;
	property offset;
	property limit;
	property name="count" default=" COUNT(*)";
	
	variables.where = '';
	variables.options = StructNew();
	variables.params = StructNew();
	variables.separator = Chr(10)&" ";
	variables.paramCount = 0;
	variables.defaultAlias = 't';
	
	public void function init(String entityName){
		setEntityName(entityName);
	}
	string function getParamKey(){
		variables.paramCount++;
		return 'p'&variables.paramCount;
	}
	void function isDistinct(isDistinct=false){
		if(isDistinct) setDistinct('DISTINCT');
	}
	public string function getSelect(){
		return 'SELECT ';
	}
	string function getFrom(){
		return 'FROM #getEntityName()# #variables.defaultAlias#';
	}
	
	void function compare(field, value, boolean partialMatch = false, operator='=', operand='AND'){
		var paramKey = this.getParamKey();
		if(partialMatch){
			variables.where &= '(#field# LIKE :#paramkey#) #operand##variables.separator#';
			addParam(paramKey,value);
		} else {
			variables.where &= '(#field# #operator# :#paramkey#) #operand##variables.separator#';
			addParam(paramKey,value);
		}

	}

	void function addCondition(condition, params, operand='AND'){
		variables.where &= '(#condition#) #operand##variables.separator#';
		// writeDump(params);
		// abort;
		for(key in params){
			addParam(key, params[key]);
		}
	}
	
	private void function addParam(key, value){
		structInsert(variables.params, key, value);
	}
	
	public void function setOrder(field, dir){
		this.order = '#arguments.field# #arguments.dir#';
	}

	public void function setQueryOptions(currentPage, pageSize){
		setLimit(arguments.pageSize);
		setOffset((arguments.currentPage-1)*arguments.pageSize);
	}

	string function buildWhere(){
		return 'WHERE '&REReplace(variables.where, "(AND|OR)\n $","","ALL");
	}

	string function buildQuery(){
		this.buildString = 
			getSelect()&getDistinct()&getFields()&variables.separator&
			getFrom()&variables.separator&
			getJoin()&variables.separator&
			buildWhere()&variables.separator&
			getOrder();
		return this.buildString;
	}

	string function buildCount(){
		this.buildString = 
			'SELECT '&getCount()&variables.separator&
			getFrom()&variables.separator&
			getJoin()&variables.separator&
			buildWhere()&variables.separator;
		return this.buildString;
	}

	Struct function getParams(){
		return variables.params;
	}

	public Struct function getQueryOptions(){
		// writeDump(variables.options);abort;
		variables.options = {
			offset : getOffset(),
			maxResults : getLimit()
		};
		return variables.options;
	}
}