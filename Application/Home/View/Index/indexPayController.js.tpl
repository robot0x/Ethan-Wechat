app.controller('indexPayController',function( $location, $http, $scope, $timeout, $ionicPopup, $stateParams, OrderFactory, $ionicLoading, RoomFactory){
    var orderId = $stateParams.orderid;
    var params;
    var orders = OrderFactory.datas.toObjectByKey();
    $scope.order = orders[orderId];      //订单
    $scope.order['price'] = fToy($scope.order['price']);
    $scope.isButtonOk   = 0; //确定按钮
    $scope.waitTime = 3;   //等待时间
    $scope.message = "";    //消息
    $scope.error = 0;       //是否出错
    $scope.success = 0;     //是否成功
    $scope.room = {};       //房型信息
    $scope.totalPrice = 0.00;  //总价格
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
                    $scope.$apply(function(){
                        $scope.message = res.errMsg;
                        $scope.error = 1;
                    });
                }
                else if (res.err_msg === undefined)
                {
                    $ionicPopup.alert({
                        title: '支付失败',
                        template: '接收到的数据类型未识别',
                    });
                    $scope.$apply(function(){
                        $scope.message = '接收到的数据类型未识别';
                        $scope.error = 1;
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
                            $scope.message = "用户取消支付，或支付未成功完成";
                            $scope.error = 1;
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
                                    $scope.success = 1;
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
                                    $scope.message = "未能正确接收支付订单信息";
                                    $scope.error = 1;
                                });
                            }
                        })
                        .error(function(res, status, header, config){
                            $ionicPopup.alert({
                                    title: '网络错误',
                                    template: '网络错误,请稍后重试',
                                });
                                $scope.$apply(function(){
                                    $scope.message = "网络错误,请稍后重试";
                                    $scope.error = 1;
                                });
                        });
                    }
                }   
                
            }
        );
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
            params = data.data.params;
            var roomId = data.data.roomId;
            var rooms = RoomFactory.rooms.toObjectByKey();
            $scope.totalPrice = fToy(data.data.totalPrice);
            $scope.room = rooms[roomId];
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
    console.log("pay");
});