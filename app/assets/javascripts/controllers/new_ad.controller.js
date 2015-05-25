huDeySell.controller('NewAdController', function($scope, HuDeySellAPIService){
	$scope.error = {
		any: false, 
		type: ""
	};

	$scope.buyOrSell = "buying";
	$scope.adName = "";
	$scope.adDescription = "";
	$scope.adCreatorEmail = "";
	$scope.town = "";
	$scope.state = "";
	$scope.adPrice = "";
	var buyingTagLine = "Chance to describe specifically what you are looking for. Don't miss it!";
	var sellingTagLine = "Chance to hype your item just the way you wish. Remember, the nicer it sounds, the better your odds :).";

	
	var validateInput = function() {
		error = {
			any: false,
			type: ""
		};

		var input = $scope.adName.split(" ");
		if (input.length < 2) {
			if(input[0] == "") {
				error.any = true;
				error.type = "No name for ad.";
			}

			return error;
		}

		if ($scope.buyOrSell === "selling") {
			if(!angular.isDefined($scope.adPrice)) {
				error = {
					any: true,
					type: 'Price is not a number.'
				}

				return error;
			}
		}

		input = $scope.adDescription.split(" ");
		if (input.length < 2) {
			if(input[0] == "") {
				error.any = true;
				error.type = "No Description for ad.";
			}

			return error;
		}

		// CRITICAL || Need better Validation for Email.
		input = $scope.adCreatorEmail.split(" ");
		if (input.length < 2) {
			if(input[0] == "") {
				error.any = true;
				error.type = "Invalid email for ad.";
			}

			return error;
		}

		input = $scope.town.split(" ");
		if (input.length < 2) {
			if(input[0] == "") {
				error.any = true;
				error.type = "No Town Entered.";
			}

			return error;
		}

		input = $scope.state.split(" ");
		if (input.length < 2) {
			if(input[0] == "") {
				error.any = true;
				error.type = "No State Entered.";
			}

			return error;
		}

		return error;
	};

	var resetError = function() {
		$scope.error = {
			any: false,
			type: ""
		}
	};

	$scope.create = function() {
		$scope.error = validateInput();
		if($scope.error.any){
			return;
		}
		var adName = $scope.adName;
		var adDescription = $scope.adDescription;
		var adCreatorEmail = $scope.adCreatorEmail;
		var adCreatorName = $scope.CreatorName? $scope.CreatorName : "";
		var adCreatorPhone = $scope.CreatorPhone? $scope.CreatorPhone : "";		
		var price = $scope.adPrice? $scope.adPrice : "";
		var address = $scope.address? $scope.address : "";
		var town = $scope.town;
		var state = $scope.state;
		params = {
			'name': adName,
			'description': adDescription,
			'creator_name': adCreatorName,
			'creator_email': adCreatorEmail,
			'creator_phone': adCreatorPhone,
			'description': adDescription,
			'price': price,
			'address': address,
			'town': town,
			'state': state
		};

		HuDeySellAPIService.createAd(params, 
			function(data, status, header){
				console.log(status);
		}, function(data, status, header) {
			console.log(data);
		});

	};

	$scope.closeErrors = function() {
		resetError();
	};

	$scope.$watch(function(){
		return $scope.buyOrSell;
	}, function(){
		if($scope.buyOrSell === "buying") {
			$scope.seller = false;
			$scope.descrPlaceholder = buyingTagLine;
		} else if ($scope.buyOrSell === "selling") {
			$scope.seller = true;
			$scope.descrPlaceholder = sellingTagLine;
		}
	})

});