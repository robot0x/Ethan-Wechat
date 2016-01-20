<script type="text/javascript">
var app = angular.module('user', []);
app.controller('userAdd', function($scope)
{
    $scope.username = "{$user.username}";
    $scope.name = "{$user.name}";
    $scope.phonenumber = "{$user.phonenumber}";
	$scope.regex = "^1[0-9]{10}$";
    $scope.email = "{$user.email}";
    $scope.edit = "{:($user ? 1 : 0)}";
});
</script>