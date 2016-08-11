<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/angular.min.js"></script>
<script src="/resources/js/jquery.bootpage.min.js"></script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
	<code ng-bind="data | json"></code>
	<div id="paging">
		
	</div>
	
	<script>
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($http, $scope){
			
			var User = {};
			var paging = {
					page: 1,
					limit: 1
				};
			
			User.findAll = function(){
				$http({
					url: 'api/u',
					params: paging,
					method: 'GET'
				}).then(function(response){
					console.log(response);
					var data = response.data;
					$scope.data = data;
					angular.element('#paging').bootpag({
			            total: data.PAGING.TOTAL_PAGES,
			            maxVisible: 2
		        	});
				}, function(response){
					
				});	
			}
			User.findAll();
			
			angular.element('#paging').on("page", function(event, num){
	        	paging.page = num;
	           	User.findAll();  
	        });
		});
		
	</script>
	
</body>
</html>