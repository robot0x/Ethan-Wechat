app.controller("personalCenter", function($scope, OrderFactory){
    $scope.test = function(type){
        OrderFactory.type = type;
    };
});