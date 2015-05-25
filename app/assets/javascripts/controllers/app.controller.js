huDeySell.controller('AppController', function($scope, $location, NATION, HuDeySellAPIService){
	//Get location. To be added in later update
	var validateString = function(string) {
		if(angular.isDefined(string) && angular.isString(string) && string != "") {
			console.log(string);
			return true;
		}		
		return false;
	}

	var params = {
		'nation': NATION
	};

	HuDeySellAPIService.getStates(params,
		function(data, status, header) {
			console.log(data);
		}, function(data, status, header) {
			console.log(data, status, header);
		});

	$scope.submit = function() {
		var state = $scope.state;
		var town = $scope.town;
		var category = $scope.category;

		if(validateString(state) /*&& validateString(town) && validateString(category)*/) {
			$scope.state = "";
			// $scope.town = "";
			// $scope.category = "";

			params['state'] = state;

			HuDeySellAPIService.getTownsForState(params,
				function(data, status, header) {
					console.log(data);
				}, function(data, status, header) {
					console.log(data, status, header);
				});

		} else {
			console.log("invalid params");
		}
	};

	$scope.stateSelected = function(e)  {
		if(e.which == 13) {
			$('#input-town').focus();
			//$scope.submit();
		}
	};

	$scope.townSelected = function(e)  {
		if(e.which == 13) {
			$('#input-category').focus();
		}
	};

	$scope.categorySelected = function(e)  {
		if(e.which == 13) {
			$scope.submit();
		}
	};

	$scope.createNewAd = function() {
		$location.path('/create-ad');
	};

	
});	