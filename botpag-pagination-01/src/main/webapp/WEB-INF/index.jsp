<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="userApp" ng-controller="userCtrl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagination with bootpag | Spring</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Angular JS -->
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	
<!-- Bootpag  -->	
<script src="/resources/js/jquery.bootpage.min.js"></script>

</head>
<body>
	<div class="container">
		<h1 style="text-align:center">User Management System</h1><hr>
		
		<div class="row">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>FIRSTNAME</th>
						<th>LASTNAME</th>
						<th>GENDER</th>
						<th>EMAIL</th>
						<th>ROLE</th>
						<th>STATUS</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="user in users">
						<td ng-bind="user.id"></td>
						<td ng-bind="user.last_name"></td>
						<td ng-bind="user.first_name"></td>
						<td ng-bind="user.gender"></td>
						<td ng-bind="user.email"></td>
						<td ng-bind="user.role"></td>
						<td ng-bind="user.status"></td>
					</tr>
				</tbody>
			</table>
			<div id="pagination">
			
			</div>
		</div>
	</div>
	<script src="/resources/js/angular/user.js"></script>
</body>
</html>