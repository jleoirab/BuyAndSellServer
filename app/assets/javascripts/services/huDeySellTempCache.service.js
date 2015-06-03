huDeySell.service('HuDeySellTempCache', function(){
	var cache = function() {
		var self = this;

		self.get = function(key, isJson){
			data = sessionStorage.getItem(key);
			if(isJson == true) {
				try {
					data = JSON.parse(data)
				} catch (e) {
					console.log("Error while converting stringified object to json");
				}
			}

			return data;
		};

		self.set = function(key, value, isJson) {
			data = value;
			if(isJson === true){
				try {
					data = JSON.stringify(data);
				} catch (e) {
					console.log("Value is not a valid JSON object");
				}
			}

			try {
				sessionStorage.setItem(key, data);
			} catch (e) {
				console.log("value is not a string");
			}
		};
	};

	return new cache();
})