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
        var params;
        var jsApiCall = function(){
            WeixinJSBridge.invoke(
                'getBrandWCPayRequest',
                params,
                function(res){
                    // alert("done");
                    // WeixinJSBridge.log(res.err_msg);
                    alert(res.err_code+res.err_desc+res.err_msg);
                }
            );
        };
        $http.get('__ROOT__/api.php/WxPay/orderPay',{params:{id: orderId}})
        .success(function(data, status, header, config){
            console.log(data);
            params = data.data;
            if (typeof WeixinJSBridge == "undefined"){
                if( document.addEventListener ){
                    document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
                }else if (document.attachEvent){
                    document.attachEvent('WeixinJSBridgeReady', jsApiCall); 
                    document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
                }
            }else{
                jsApiCall();
            }
        })
        .error(function(data, status, header, config){
            
        });
    
    return;

    };
});