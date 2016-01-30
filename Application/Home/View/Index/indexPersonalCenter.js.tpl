app.controller("personalCenter", function($scope, OrderFactory, CustomerFactory){
    $scope.test = function(type){
        OrderFactory.type = type;
    };
    $scope.phone        = "";
    $scope.headimgurl   = "__IMG__/1024.jpg";
    $scope.nickname     = "";

    if (OrderFactory.orderInfo.customerPhone !== undefined)
    {
        $scope.phone = OrderFactory.orderInfo.customerPhone;
    }
    if (CustomerFactory.headimgurl !== undefined)
    {
        $scope.headimgurl = CustomerFactory.headimgurl;
    }
    if (CustomerFactory.nickname !== undefined)
    {
        $scope.nickname = CustomerFactory.nickname;
    }   
});