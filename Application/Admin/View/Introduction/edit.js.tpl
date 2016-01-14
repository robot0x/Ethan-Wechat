<script type="text/javascript">
	var app = angular.module('introduction',[]);
	app.controller("edit", function($scope){
		$scope.hotel_phone = "{$introduction["hotel_phone"]}";
		$scope.regex = "^1[0-9]{10}$"
	});
</script>