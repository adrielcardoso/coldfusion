component accessors=true {

	property total;
	property totalPages;
	/**
	* @type numeric
	*/
	property currentPage;
	property pages;
	property offset;
	property options;

	variables.pageVar = 'page';
	variables.defaultPageSize = 10;
	variables.maxButtonCount = 5;

	public void function init(options){
		setOptions({
			pageSize : variables.defaultPageSize,
			maxButtonCount : variables.maxButtonCount
		});
		if(structKeyExists(arguments, "options")) setOptions(arguments.options);
	}

	public void function setCurrentPage(){

	}

	public numeric function getCurrentPage(){
		this.currentPage = 1;
		if(structKeyExists(url, variables.pageVar)){
			this.currentPage = structGet("url.#variables.pageVar#");
			if(this.currentPage < 0){
				this.currentPage = 1;
			} else if(this.currentPage > getTotalPages()){
				this.currentPage = getTotalPages();
			}
		}
		return this.currentPage;
	}

	public numeric function getTotalPages(){
		return ceiling(getTotal()/getOptions().pageSize);
	}

	private void function setPages(Struct pages){
		this.pages = pages;
	}

	public Struct function getPages(){
		this.pages = {
			prev : getPrevPage(),
			next : getNextPage(),
			numbers : getPageRange(),
			last : getTotalPages(),
			first : 1
		};
		// writeDump(this.pages.numbers.start);abort;
		return this.pages;
	}
	
	public string function getPrevPage(){
		return getCurrentPage() == 1 ? getCurrentPage() : getCurrentPage()-1;
	}
	
	public string function getNextPage(){
		return getCurrentPage() >= getTotalPages() ? getCurrentPage() : getCurrentPage()+1;
	}

	public string function pageLink(num){
		return '#variables.pageVar#=#arguments.num#';
	}

	private function getPageRange(){
		var beginPage = max(0, getCurrentPage()-Int(variables.maxButtonCount/2));
		var endPage = beginPage+variables.maxButtonCount-1;
		if(endPage >= getTotalPages()) {
			endPage=getTotalPages()-1;
			beginPage=max(0, endPage-variables.maxButtonCount+1);
		}
		return {
			'start' : beginPage+1,
			'end' : endPage+1
		};
	}

}