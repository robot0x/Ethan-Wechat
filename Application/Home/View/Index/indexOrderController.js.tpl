app.controller("order", function($scope, $location, $ionicPopup, $http, $stateParams, OrderFactory, RoomFactory, BaseService){
    var type = $stateParams.type;
    $scope.title = OrderFactory.title(type);
    $scope.rooms = RoomFactory.rooms.toObjectByKey();
    $scope.getFirstUrl = function(urls){
        return urls.split(',')[0];
    };
    $scope.fenToYuan = function(fen){
        return BaseService.fenToYuan(fen);
    };
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