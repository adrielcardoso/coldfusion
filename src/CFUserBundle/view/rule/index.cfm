<cfoutput>

	<!-- add menu to page -->
	#data['load'].view('default/menu.template', data)#

	<div class="row" style="padding-top:3%; text-align:center;" ng-app='rule' ng-controller='ruleController'>

		<h4 id='title'>
			All users
		</h4>

		<div class="row">
	       <div class="col s12 m6 offset-m3">

		 		<div class="row">

				   <div id='progress' class="progress">
				      <div class="indeterminate"></div>
				   </div>

				    <div class="row">

				    	 <h1 ng-bind='message'></h1>

					      <div class="collection" ng-repeat='single in data'>
							    <a ng-model='single' class="collection-item" ng-click='eventUser(single)'>
						    	    {{single.stFullName}}
						    		<span class="badge">1</span>
							    </a>
						  </div>

				    </div>
        	     </div>
	         </div>
	        <!---  #data['req'].createUrl(data['assets']['menu_button']['bundle'], data['assets']['menu_button']['controller'], data['assets']['menu_button']['action'])# --->
		 </div>
	</div>

</cfoutput>

