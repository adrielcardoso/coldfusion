<cfoutput>
	<nav class="orange lighten-2">
		<div class="nav-wrapper">

		  	  <a href="" class="brand-logo">ColdFusion - KiT</a>

			  <ul id="nav-mobile" class="right hide-on-med-and-down">
			    <li>
			    	<a href="#data['req'].createUrl(data['assets']['menu_button']['bundle'], data['assets']['menu_button']['controller'], data['assets']['menu_button']['action'])#">#data['assets']['menu_button']['label']#</a>
			    </li>
			  </ul>

			<div class="progress" id='load'>
			  <div class="indeterminate"></div>
			</div>
		</div>
	</nav>
</cfoutput>