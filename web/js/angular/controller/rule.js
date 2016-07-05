angular.module('rule', [])

	.controller('ruleController', function($scope, $http){

		$scope.getRules = function(host)
		{

			var host = 'http://localhost:8500/?bundle=user&event=rule&action=findList&responsetype=json';


			$scope.message = 'Aguarde...';

			angular.element(document).ready(function () {

				$http.post(host)
					.success(function(data){
						console.log(JSON.parse(data.data).userList);
						$('#progress').fadeOut(0);
						$scope.message = '';
						$scope.data = JSON.parse(data.data).userList;
					})
					.error(function(e){
						$('#progress').fadeOut(0);
						$('#title').fadeOut(0);
						$scope.message = 'Aconteceu algum erro favor tente novamente';
					});
			});
		 };

		 $scope.eventUser = function(elem){

		 	console.log(host);
		 }

		 function init(){
		 	$scope.getRules();
		 }

		 init();

	});