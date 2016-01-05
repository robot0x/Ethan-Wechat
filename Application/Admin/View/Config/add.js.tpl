<script>
var app = angular.module('config', []);
app.controller('configAdd', function($scope) {
    console.log("start");
    $scope.configname = "{$config.name}";
    $scope.edit = "{:($config ? 1 : 0)}";
});
</script>
