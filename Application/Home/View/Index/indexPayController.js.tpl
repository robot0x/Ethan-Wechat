app.controller('indexPayController',function($http, $scope, $timeout, $ionicPopup, $stateParams){
    var orderId = $stateParams.orderid;
    var params;
    $scope.waitTime = 10;   //等待时间
    $scope.message = "正在支付";
    $scope.paying = 1;
    $scope.fail = 1;
    $scope.success = 1;
    var jsApiCall = function(){
        WeixinJSBridge.invoke(
            'getBrandWCPayRequest',
            params,
            function(res){
                if (res.return_code == "FAIL")
                {
                    $ionicPopup.alert({
                        title: '系统错误:',
                        template: res.return_msg,
                    });
                    $scope.$apply(function(){
                        $scope.message = "支付失败";
                    });
                }
                else if (res.result_code == 'SUCCESS')
                {
                    $scope.$apply(function(){
                        $scope.message = "支付成功";
                    });
                }
                else
                {
                    //用户如果未提义，则返回的将是undeifined
                    if (res.err_code !== undefined)
                    {
                        $ionicPopup.alert({
                            title: '支付失败:'+res.err_code,
                            template: '原因:'+res.err_code_des,
                        });  
                    }
                    else
                    {
                        $ionicPopup.alert({
                            title: '支付失败:',
                            template: '支付被用户取消',
                        }); 
                    }
                      
                    $scope.$apply(function(){
                        $scope.message = "支付失败";
                    });
                }

                onTimeOut();
            }
        );
    };

    //倒计时，并进行页面的跳转
    var onTimeOut = function(){
        $scope.waitTime--;
        if (!$scope.waitTime)
        {
            window.location.href = "__ROOT__/index.php";
            return;
        }
        else
        {
            $timeout(onTimeOut,1000);
        }
    };
    var pay = function(){
        $http.get('__ROOT__/api.php/WxPay/orderPay',{params:{id: orderId}})
        .success(function(data, status, header, config){
            if (data.status == "error")
            {
               $ionicPopup.alert({
                    title: '亲，出错啦!',
                    template: data.message,
                });
                return;
            }
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
            $ionicPopup.alert({
                title: '亲，出错啦!',
                template: '系统错误:indexOrderController.js:pay.http.error',
            });
            return;
        });
    };
    pay();
});