app.controller("order", function($scope, $location, $ionicPopup, $http, $stateParams, OrderFactory){
    var type = $stateParams.type;
    $scope.title = OrderFactory.title(type);

    var map = new Array();
    switch (type)
    {
        case "toBePaid" : 
            $scope.orders = OrderFactory.toBePaid;
            break;
        case "toBeEvaluation" :
            $scope.orders = OrderFactory.toBeEvaluation;
            break;
        case "toBeStay" :
            $scope.orders = OrderFactory.toBeStay;
            break;
        default:
            $scope.orders = OrderFactory.datas;
            break;
    };
});