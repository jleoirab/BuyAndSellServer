huDeySell = angular.module('HuDeySell', [
	'ngRoute',
	'templates'
]).config(function($routeProvider, $locationProvider) {
	$routeProvider
	.when('/', {
		templateUrl: 'index.html',
		controller: 'AppController'
	})
	.otherwise({
		redirectTo: '/'
	});

	$locationProvider.html5Mode(false);
}).constant('APP_NAME', 'Hu Dey Sell')
  .constant('APP_VERSION', '0.1')
  .constant('API_URL', 'localhost:3000');