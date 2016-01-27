app.controller('indexPayController',function($http, $scope, $timeout, $ionicPopup, $stateParams){
    var orderId = $stateParams.orderid;
    var params;
    $scope.isButtonOk   = 0; //确定按钮
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
                console.log(res);
                if (res.errMsg !== undefined)
                {
                    $ionicPopup.alert({
                        title: '支付失败',
                        template: '原因:'+res.errMsg,
                    });
                    return;
                }

                if (res.err_msg === undefined)
                {
                    $ionicPopup.alert({
                        title: '支付失败',
                        template: '接收到的数据类型未识别',
                    });
                    return;
                }

                alert(res.err_msg);
                if (res.err_msg !== "get_brand_wcpay_request:ok")
                {
                    $ionicPopup.alert({
                        title: '支付失败',
                        template: '用户取消支付，或支付未成功完成',
                    });
                    $scope.$apply(function(){
                        $scope.message = "支付失败";
                    });
                }
                else
                {
                    $scope.$apply(function(){
                        $scope.message = "支付成功";
                    });
                }

                onTimeOut();//倒计时
            }
        );
    };

    //倒计时，并进行页面的跳转
    var onTimeOut = function(){
        $scope.waitTime--;
        if (!$scope.waitTime)
        {
            $scope.$apply(function(){
                $scope.isButtonOk = 1;
            });
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