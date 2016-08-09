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
<style>
	*{
		border-radius: 0px !important;
	}
</style>
</head>
<body>
	<div class="container">
		<h1 style="text-align:center">USER MANAGEMENT SYSTEM</h1><hr>
		<div class="row">
			<div class="col-sm-3">	
				<select class="form-control">
					<option>ALL ROLES</option>
					<option>Admin</option>
					<option>Editor</option>
					<option>Subscriber</option>
					<option>Visitor</option>
				</select>
			</div>
			<div class="col-sm-3">	
				<select class="form-control">
					<option>ALL GENDERS</option>
					<option>Male</option>
					<option>Female</option>
				</select>
			</div>
			<div class="col-sm-2">	
				<select class="form-control">
					<option>ALL STATUS</option>
					<option>Enable</option>
					<option>Disable</option>
				</select>
			</div>
			<div class="col-sm-2">	
				<input type="text" class="form-control" placeholder="Search Firstname" >
			</div>
			<div class="col-sm-2">	
				<input type="text" class="form-control" placeholder="Search Lastname" >
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12"><hr>
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
			</div>
			<div id="pagination" class="col-sm-12"></div>
		</div>
	</div>
	<script src="/resources/js/angular/user.js"></script>
</body>
</html>