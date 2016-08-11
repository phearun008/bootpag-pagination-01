<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="userApp" ng-controller="userCtrl">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagination with Bootpag | Spring</title>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/angular.min.js"></script>
<script src="/resources/js/jquery.bootpage.min.js"></script>

<style>
	*{
		border-radius: 0px !important;
	}
</style>
</head>
<body>
	<div class="container">
		<h1 style="text-align:center">USER MANAGEMENT SYSTEM</h1>
		<code><a href="https://github.com/phearun008/bootpag-pagination-01" target="_blank">Source Code</a></code>
		<hr>
		<div class="row">
			<div class="col-sm-3">	
				<select class="form-control" ng-change="roleChange(role)" ng-model="role">
					<option ng-repeat="role in roles" ng-bind="role.text" ng-value="role.value"></option>
				</select>
			</div>
			<div class="col-sm-3">	
				<select class="form-control" ng-change="genderChange(gender)" ng-model="gender">
					<option ng-repeat="gender in genders" ng-bind="gender.text" ng-value="gender.value"></option>
				</select>
			</div>
			<div class="col-sm-2">	
				<select class="form-control" ng-change="statusChange(s)" ng-model="s">
					<option ng-repeat="s in status" ng-bind="s.text" ng-value="s.value"></option>
				</select>
			</div>
			<div class="col-sm-2">	
				<input ng-model="filter.firstName" type="text" ng-keyup="firstNameChange()" class="form-control" placeholder="Search Firstname" >
			</div>
			<div class="col-sm-2">	
				<input ng-model="filter.lastName" ng-keyup="lastNameChange()" type="text" class="form-control" placeholder="Search Lastname" >
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
							<td ng-bind="user.first_name"></td>
							<td ng-bind="user.last_name"></td>
							<td ng-bind="user.gender"></td>
							<td ng-bind="user.email"></td>
							<td ng-bind="user.role"></td>
							<td ng-bind="user.status"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<p>Showing 1 to <span ng-bind="filter.limit"></span> of <span ng-bind="paging.totalRecords"></span> entries</p>
				<select class="form-control" ng-change="rowChange(row)" ng-model="row">
					<option ng-repeat="row in rows" ng-bind="row" ng-value="row"></option>
				</select>
			</div>
			<div class="pull-right">
				<div id="pagination" class="col-sm-12"></div>		
			</div>
		</div>
		<code>{{filter | json}}</code>
	</div>
	<script src="/resources/js/angular/user.js"></script>
</body>
</html>