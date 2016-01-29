app.controller('indexPayController',function($location, $http, $scope, $timeout, $ionicPopup, $stateParams, OrderFactory, $ionicLoading){
    var orderId = $stateParams.orderid;
    var params;
    $scope.isButtonOk   = 0; //确定按钮
    $scope.waitTime = 3;   //等待时间
    $scope.message = "正在支付";
    $scope.paying = 1;
    $scope.fail = 1;
    $scope.success = 1;
    var jsApiCall = function(){
        $ionicLoading.show({
            template: '正在发起支付...'
        });
        WeixinJSBridge.invoke(
            'getBrandWCPayRequest',
            params,
            function(res){
                $ionicLoading.hide();
                if (res.errMsg !== undefined)
                {
                    $ionicPopup.alert({
                        title: '支付失败',
                        template: '原因:'+res.errMsg,
                    });
                }
                else if (res.err_msg === undefined)
                {
                    $ionicPopup.alert({
                        title: '支付失败',
                        template: '接收到的数据类型未识别',
                    });
                    // return;
                }
                else 
                {
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
                        $http.get("__ROOT__/api.php/WxPay/queryOrder", {params:{order_id: orderId}})
                        .success(function(res, status, header, config){
                            if (res.status == "success")
                            {
                                $scope.$apply(function(){
                                    $scope.message = "支付成功";
                                });

                                //更新订单信息
                                OrderFactory.orderIsPay(orderId);
                            }
                            else
                            {   
                                $ionicPopup.alert({
                                    title: '支付失败',
                                    template: '未能正确接收支付订单信息',
                                });
                                $scope.$apply(function(){
                                    $scope.message = "支付失败";
                                });
                            }
                        })
                        .error(function(res, status, header, config){
                            alert("网络错误,请稍后重试");
                        });
                        //重写factory
                    }
                }   
                // //重新请求订单数据
                // OrderFactory.initDatas();
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

            //强制刷新
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
                $ionicPopup.alert({
                    title: '亲，出错啦!',
                    template: '未获取到WeixinJSBridge，请退出微信后重试',
                }); 
                // //重新请求订
                // OrderFactory.initDatas();
                window.location.href = "__ROOT__/index.php";
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