huDeySell = angular.module('HuDeySell', [
	'ngRoute',
	'templates'
]).config(function($routeProvider, $locationProvider) {
	$routeProvider
	.when('/', {
		templateUrl: 'index.html',
		controller: 'AppController'
	})
	.when('/create-ad', {
		templateUrl: 'new-ad.html',
		controller: 'NewAdController'
	})
	.when('/:ad_id', {
		templateUrl: 'show-ad.html',
		controller: 'ShowAdController'
	})
	.otherwise({
		redirectTo: '/'
	});

	$locationProvider.html5Mode(false);
}).constant('APP_NAME', 'Hu Dey Sell')
  .constant('APP_VERSION', '0.1')
  .constant('NATION', 'Nigeria')
  .constant('API_URL', 'http://localhost:3000/api/');