huDeySell.directive('hdsItem', function() {
	return {
		restrict: 'E',
		scope: {
			ad: '=model'
		},
		controller: 'hdsItemController',
		templateUrl: '_ad-item.html',
		link: function($scope, element, attrs) {
			// console.log($scope.ad)
		}
	}
});


huDeySell.controller('hdsItemController', function($scope, $location) {
	console.log('controller is connected');

	$scope.showItem = function() {
		$location.path('/' + $scope.ad.id)
	};
});