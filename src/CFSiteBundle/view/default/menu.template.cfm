<cfoutput>
	<nav class="orange lighten-2">
		<div class="nav-wrapper">

		  	  <a href="" class="brand-logo">ColdFusion - KiT</a>

			  <ul id="nav-mobile" class="right hide-on-med-and-down">
			    <li>
			    	<a href="collapsible.html"></a>
			    </li>
			  </ul>

			<div class="progress" id='load'>
			  <div class="indeterminate"></div>
			</div>
		</div>
	</nav>

	<div class="fixed-action-btn horizontal click-to-toggle" style="bottom: 45px; right: 24px;">
		<a class="btn-floating btn-large red">
		  <i class="material-icons">menu</i>
		</a>
		<ul>
		  <li><a href="#data['req'].createUrl('user', 'credential', 'logout')#" class="btn-floating red"><i class="material-icons">power_settings_new</i></a></li>
		  <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
		  <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
		  <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
		</ul>
	</div>
</cfoutput>