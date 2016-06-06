component {
	/**
	* @type Criteria
	*/
	property criteria;
	property data;
	property paginationOptions;
	property sort;
	property count;
	property results;
	/**
	* @type Pagination
	*/
	property pagination;

	public DataProvider function init(options){
		if(StructKeyExists(arguments,'options.criteria')) this.criteria = arguments.options.criteria;
		if(StructKeyExists(arguments,'options.pagination')) this.paginationOptions = arguments.options.pagination;
		if(StructKeyExists(arguments,'options.sort')) this.sort = arguments.options.sort;
		return this;
	}

	public function getData(){
		this.criteria.setQueryOptions(this.pagination.getCurrentPage(), this.pagination.getOptions().pageSize);
		this.results = ormExecuteQuery(this.criteria.buildQuery(), this.criteria.getParams(), this.criteria.getQueryOptions());
		return this.results;
	}

	public numeric function getCount(){
		this.count = ormExecuteQuery(this.criteria.buildCount(), this.criteria.getParams());
		return this.count[1];
	}

	public void function setCriteria(Criteria criteria){
		this.criteria = arguments.criteria;
	}

	public void function setPagination(Pagination pagination){		
		this.pagination = arguments.pagination;
		this.pagination.setTotal(this.getCount());
	}

	public Pagination function getPagination(){
		return this.pagination ?: new Pagination();
	}

}