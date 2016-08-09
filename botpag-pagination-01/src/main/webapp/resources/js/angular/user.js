/**
 * 
 */
var app = angular.module('userApp', []);
app.controller('userCtrl', function($scope, $http){
	
	//TODO: define base url
	var base_url = "http://localhost:7777";
	
	//TODO:
	$scope.users = [];
	
	$scope.roles = [{value: 'all', text: 'ALL ROLES'},
	                {value: 'admin', text: 'Administrator'},
	                {value: 'editor', text: 'Editor'},
	                {value: 'subscriber', text: 'Subscriber'},
	                {value: 'visitor', text: 'Visitor'}];
	
	$scope.genders = [{value: 'all', text: 'ALL GENDERS'},
	                  {value: 'male', text: 'Male'},
	                  {value: 'female', text: 'Female'}];
	
	$scope.status = [{value: 'all', text: 'ALL STATUS'},
	                 {value: '1', text: 'Enable'},
	                 {value: '0', text: 'Disable'}]
	
	$scope.rows = [1, 2, 3, 5];
	
	//TODO: default filter
	$scope.filter = {
		page: 1,
		limit: $scope.rows[0],
		firstName: null,
		lastName: null,
		status: null,
		roleName: null,
		gender: null
	};
	
	//TODO: 
	$scope.paging = {};
	
	//TODO: on role change
	$scope.roleChange = function(role){
		$scope.filter.roleName = role === 'all'?null:role;
		USER.findAll();
	};
	
	//TODO: on gender change
	$scope.genderChange = function(gender){
		console.log(gender);
		$scope.filter.gender = gender === 'all'?null:gender;
		USER.findAll();
	};
	
	//TODO: on status change
	$scope.statusChange = function(status){
		$scope.filter.status = status ==='all'?null:status;
		USER.findAll();
	};
	
	//TODO: on first name change
	$scope.firstNameChange = function(){
		USER.findAll();
	};
	
	//TODO: on last name change
	$scope.lastNameChange = function(){
		USER.findAll();
	};
	
	//TODO: on row change
	$scope.rowChange = function(row){
		$scope.filter.limit = row;
		USER.findAll();
	};
	
	//TODO: 
	var PAGINATION = angular.element('#pagination'); 
	
	
	//TODO: declare user object
	var USER = {};
	
	//TODO: load Pagination
	USER.loadPagination = function(response){
		//TODO: Initialize pagination setting
		$scope.paging = {
			totalPages: response.PAGING.TOTAL_PAGES,
			totalRecords: response.PAGING.TOTAL_COUNT,
			currentPage: response.PAGING.PAGE,
			limit: response.PAGING.LIMIT
		};
		//TODO:
		PAGINATION.bootpag({
	        total: $scope.paging.totalPages==0?1:$scope.paging.totalPages,
	        page: $scope.paging.currentPage,
	        leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 5
	    });	    
	};
	
	//TODO: add listener to page click
	PAGINATION.on("page", function(event, pageNumber){
		$scope.filter.page = pageNumber;
		USER.findAll();
	});
	
	//TODO: define method for load all records
	USER.findAll = function(){
		$http({
			url: base_url + '/api/user',
			method: 'GET',
			params: $scope.filter
		}).then(function(success){
			console.log(success);
			$scope.users = success.data.DATA;
			USER.loadPagination(success.data);
		}, function(error){
			console.log(error);
		});
	};
	
	//TODO: Reload data again
	USER.reload = function(filter){
		$scope.filter = filter;
		USER.findAll();
	};
	
	//TODO: 
	USER.findAll();
});