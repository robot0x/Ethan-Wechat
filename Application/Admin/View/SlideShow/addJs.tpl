<script>
var app = angular.module('slideshow', []);
app.controller('slideshowAdd', function($scope) {
    console.log("start");
    $scope.title = "{$slideshow.title}";
    $scope.weight = "{$slideshow.weight}";
});
</script>