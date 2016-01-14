<script>
var app = angular.module('config', []);
app.controller('configAdd', function($scope) {
    console.log("start");
    $scope.name = "{$config.name}";
    $scope.edit = "{:($config ? 1 : 0)}";
    $scope.type = "{$config.type}";
    $scope.value = "{$config.value}";
    $scope.remark = "{$config.remark}";
});
</script>
