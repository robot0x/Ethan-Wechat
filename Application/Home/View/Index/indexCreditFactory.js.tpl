app.factory('CreditFactory', function(){
	var credit = {:json_encode($M->credit)};
	return {
		"credit" : credit,
	};
})