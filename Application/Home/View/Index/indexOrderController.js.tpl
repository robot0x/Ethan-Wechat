app.controller("order", function($scope, $http, $stateParams, OrderFactory){
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
    $scope.pay = function(order){
        console.log("order");
        var orderId = order.id;
        $http.get('__ROOT__/api.php',{params:{id: orderId}})
        .success(function(data, status, header, config){

        })
        .error(function(data, status, header, config){
            
        });
    
    return;
        wx.ready(function(){
            wx.chooseWXPay({
            timestamp: 0, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
            nonceStr: '', // 支付签名随机串，不长于 32 位
            package: '', // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
            signType: '', // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
            paySign: '', // 支付签名
            success: function (res) {
        // 支付成功后的回调函数
    }
});
        });
    };
});