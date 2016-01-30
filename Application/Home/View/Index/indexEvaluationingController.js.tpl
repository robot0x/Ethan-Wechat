  app.controller("EvaluationingCtrl", function($scope,$http){
    $scope.max = 5;
    $scope.ratingVal = 2;
    $scope.readonly = false;
    $scope.onHover = function(val){
      $scope.hoverVal = val;
    };
    $scope.onLeave = function(){
      $scope.hoverVal = null;
    }
    $scope.onChange = function(val){
      $scope.ratingVal = val;
    }
    $scope.getStarLeave = function() {
      alert($scope.ratingVal);
    }