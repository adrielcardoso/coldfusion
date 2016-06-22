<cfoutput>

	<!-- add menu to page -->
	#data['load'].view('default/menu.template', data)#

	<div class="row" style="padding-top:3%; text-align:center;">

		<h4>
			#data['name']#
		</h4>

		 <div class="row">
	        <div class="col s12 m12">

		 		<div class="row">
	        	 <div class="col s12 m6 offset-m3">
		          <div class="card">
		            <div class="card-image">
		              <img src="web/images/card1.jpg">
		              <span class="card-title">Card Title</span>
		            </div>
		            <div class="card-content">
		              <p>I am a very simple card. I am good at containing small bits of information.
		              I am convenient because I require little markup to use effectively.</p>
		            </div>
		            <div class="card-action">
		              <a href="">This is a link</a>
		            </div>
		          </div>
		          </div>
		        </div>

		        <div class="row">
	        	 <div class="col s12 m6 offset-m3">
		          <div class="card">
		            <div class="card-image">
		              <img src="web/images/card1.jpg">
		              <span class="card-title">Card Title</span>
		            </div>
		            <div class="card-content">
		              <p>I am a very simple card. I am good at containing small bits of information.
		              I am convenient because I require little markup to use effectively.</p>
		            </div>
		            <div class="card-action">
		              <a href="">This is a link</a>
		            </div>
		          </div>
		          </div>
		        </div>

	        </div>
        </div>
	 </div>

</cfoutput>

