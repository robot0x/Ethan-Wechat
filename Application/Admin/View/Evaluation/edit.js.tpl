<script type="text/javascript">
	var app = angular.module('evaluation', []);
	app.controller('edit', function($scope, $timeout, $http){
		$scope.order__customer_id = "{$list['order__customer_id']}";
		$scope.nickname  = "{$list['customer__nickname']}";


		if ($scope.order__customer_id != "")
		{
			$scope.isuser = 1;
			$scope.showspan = 1;
		}
		else
		{
			$scope.isuser = 0;
			$scope.showspan = 0;
		}

		$scope.$watch("isuser", function(){
			if ($scope.isuser)
			{
				$scope.openidClass = "";
			}
			else
			{
				$scope.openidClass = "has-error";
			}
		});

		$scope.$watch("order__customer_id", function(){
			if ($scope.order__customer_id !== "")
			{
				$timeout(function(){
					$http({
						method:'get',
						url:'{:U("getCustomerInfoByCustomerIdAjax")}',
						params:{customer_id: $scope.order__customer_id},
					})
					.then(function successCallback(response){
						if (response.data.status === "success")
						{
							$scope.nickname = response.data.data.nickname;
							$scope.isuser = 1;
						}
						else
						{
							$scope.nickname = "";
							$scope.isuser = 0;
						}
						console.log(response);

					}, function errorCallback(response){

					});
				}, 1500);
			}
			
		});
		
	})
</script>
