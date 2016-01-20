<script>
var app = angular.module('user', []);
app.controller('userAdd', function($scope) {
	console.log("start");
    $scope.username = '{$user.username}';
    $scope.name = '{$user.name}';
    $scope.email = '{$user.email}';
    $scope.edit = '{:($user ? 1 : 0)}';
});
</script>