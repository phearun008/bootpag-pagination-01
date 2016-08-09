/**
 * 
 */
var app = angular.module('userApp', []);
app.controller('userCtrl', function($scope, $http){
	
	//TODO: define base url
	var base_url = "http://localhost:7777";
	
	//TODO:
	$scope.users = [];
	
	//TODO: default filter
	$scope.filter = {
		page: 1,
		limit: 2,
		firstName: null,
		lastName: null,
		status: null,
		roleName: null,
		gender: null
	};
	
	//TODO: 
	$scope.paging = {};
	
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
			url: base_url + '/api/user',
			method: 'GET',
			params: $scope.filter
		}).then(function(success){
			console.log(success);
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