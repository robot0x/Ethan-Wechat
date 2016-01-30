app.controller("personalCenter", function($scope, OrderFactory, CustomerFactory,CreditFactory,IntroductionFactory){
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
    if (CreditFactory.credit.total !== undefined)
    {
        $scope.credit = CreditFactory.credit.total;
    }
    if (IntroductionFactory.introduction.hotel_phone !== undefined)
    {
        $scope.hotelPhone = IntroductionFactory.introduction.hotel_phone;
    }
});