/**
 * 
 */
var app = angular.module('userApp', []);
app.controller('userCtrl', function($scope, $http){
	
	//TODO: define base url
	var BASE_URL = "http://localhost:7777";
	
	//TODO: declare user object
	var USER = {};
	
	//TODO:
	$scope.users = [];
	
	//TODO: default filter
	$scope.filter = {
		page: 1,
		limit: 2,
		firstName: '',
		lastName: '',
		status: '',
		roleName: '',
		gender: ''
	};
	
	//TODO: 
	$scope.paging = {};
	
	//TODO: 
	var PAGINATION = angular.element('#pagination'); 
	
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
	        total: $scope.paging.totalPages,
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
			url: BASE_URL + '/api/user',
			method: 'GET',
			params: $scope.filter
		}).then(function(success){
			$scope.users = success.data.DATA;
			USER.loadPagination(success.data);
			console.log($scope.users);
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