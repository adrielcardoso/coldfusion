<!DOCTYPE html>
<html>
	<head>
	  <!--Import Google Icon Font-->
	  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	  <!--Import materialize.css-->

	   <!-- Compiled and minified CSS -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">

	  <!-- custumer -->
	  <link src='/web/css/style.css' />

	  <!--Let browser know website is optimized for mobile-->
	  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	</head>

	<body>

	  <cfinclude
			template = '#data["template"]#'>

	  <!--Import jQuery before materialize.js-->
	  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	  <!-- Compiled and minified JavaScript -->
  	  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

  	  <!--- angular --->
  	  <script src='/web/lib/angular/angular.min.js' type="text/javascript"></script>

  	  <!--- angular definitions	 --->
  	  <script src='/web/js/angular/controller/rule.js' type="text/javascript"></script>

  	  <script>

	  	  	$(document).ready(function(){

	  	  		$('#load').fadeOut(100);
	  	  	});

  	  </script>
	</body>
</html>

