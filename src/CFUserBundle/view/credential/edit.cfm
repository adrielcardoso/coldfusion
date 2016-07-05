<cfoutput>

	<!-- add menu to page -->
	#data['load'].view('default/menu.template')#

</cfoutput>


<div class="row" style="padding-top:3%; text-align:center;">

	<h4>
	update user
</h4>


	 <div style='width:50%; background: aqua; margin:auto !important; position:relative; height:none;'>
	 	<form class="col s12">
		    <div class="row" style="text-align:left;">

		       <div class="row">
		        <div class="input-field col s12">
		          <input type="text" class="validate">
		          <label for="email">Full name</label>
		        </div>
		      </div>

		      <div class="row">
		        <div class="input-field col s12">
		          <input id="email" type="email" class="validate">
		          <label for="email">Email</label>
		        </div>
		      </div>

		      <div class="row">
		        <div class="input-field col s12">
		          <input id="password" type="password" class="validate">
		          <label for="password">Password</label>
		        </div>
		      </div>
		    </div>
	    </form>
	</div>
</div>

