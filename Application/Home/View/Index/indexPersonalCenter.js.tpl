app.controller("personalCenter", function($scope,CreditFactory, OrderFactory,IntroductionFactory){
    $scope.test = function(type){
        OrderFactory.type = type;
    };
    $scope.phone = OrderFactory.orderInfo.customerPhone;
    $scope.credit = CreditFactory.credit.total;
    $scope.hotelPhone   = IntroductionFactory.introduction.hotel_phone;
});