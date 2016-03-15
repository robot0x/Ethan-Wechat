  app.controller("EvaluationingCtrl", function($scope,$http, $ionicLoading,$stateParams, $state, $ionicPopup, RoomFactory, OrderFactory){
    var orderid = $stateParams.orderid;
    var orders = OrderFactory.datas.toObjectByKey();
    var rooms = RoomFactory.rooms.toObjectByKey();
    var order = orders[orderid];
    $scope.room = rooms[order.room_id];
    $scope.evaluation = '';
    $scope.max = 5;                      //星星个数
    var starLevel = $scope.ratingVal = 4;//初始化星星显示个数
    $scope.readonly = false;             //只读属性
    $scope.localIds = new Array();       //用户上传后的图片本地URL
    var serverIds = new Array();         //用于服务器取微信服务器暂存的图片
    var maxCount = 5;                    //最多上传照片数
    $scope.showUpload = 1;               //是否显示上传按钮
    var urls = new Array();              //微信下载图片的服务器地址
    $scope.onHover = function(val){
      $scope.hoverVal = val;
    };
    $scope.onLeave = function(){
      $scope.hoverVal = null;
    }
    $scope.onChange = function(val){
      $scope.ratingVal = val;
    }
    $scope.getStarLeave = function() {
      console.log($scope.ratingVal);
      starLevel = $scope.ratingVal;
    }

    $scope.nameDefault = function(nickname)
    {
        if (nickname == undefined)
        {
            return "非关注用户";
        }
        return nickname;
    }

    //判断安卓手机还是苹果手机
    // var u = navigator.userAgent;
    // var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
    // var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
    // alert('是否是Android：'+isAndroid);
    // alert('是否是iOS：'+isiOS);

    var upload = function(localIds){
        var length = localIds.length;//需要进行上传的图片个数
        if(length == 0)
        {
            $ionicLoading.hide();
            return;
        }
        var localId = localIds[0];
        wx.uploadImage({
            localId: localId,       // 需要上传的图片的本地ID，由chooseImage接口获得
            isShowProgressTips: 1,  // 默认为1，显示进度提示
            success: function (res) {
                // serverIds.push(res.serverId); // 返回图片的服务器端ID
                // alert(res.serverId);
                var serverId = res.serverId;
                    $http.get("__ROOT__/api.php/Evaluation/saveImageByserverId",{params:{serverId:serverId}})
                   .success(function(data,status){
                        if (data.status === 'success') {
                            urls.push(data.url);
                            $scope.localIds.push(data.url);
                            maxCount--;
                            if (maxCount <= 0)
                            {
                                $scope.showUpload = 0;
                            }
                            // alert(localIds);
                            // alert(localId);
                            localIds.shift();
                            // alert(localIds);
                            upload(localIds);
                        }
                        else{
                            $ionicPopup.alert({
                                title: '系统错误',
                                template: data.message,
                            });
                        }
                    })
                   .error(function(data,status){
                        $ionicPopup.alert({
                            title: '网络错误',
                            template: "网络状态不佳，请您稍后重试",
                        });
                   });
                
            },
            error:function(res){
                $ionicLoading.hide();
            },
        });
        };


    //用户点击上传图片
    $scope.upload = function(){
        $ionicLoading.show({template: '<ion-spinner></ion-spinner>'});
        wx.ready(function () {
            wx.chooseImage({
                count: maxCount, //最大上传数量
                sizeType: ['original'], 
                success: function (res) {
                    console.log('已选择 ' + res.localIds.length + ' 张图片');
                    // res.localIds.forEach(function(element){
                    //     $scope.localIds.push(element);
                    //     alert($scope.localIds);
                    // });
                    upload(res.localIds); //上传图片
                },
                error: function(res){
                    $ionicLoading.hide();
                }
            });
        }); 
    }; 

    //提交评论
    $scope.submit = function(event){
        var evaluation = $scope.evaluation;
        // alert(urls.join(","));
        var params = {url:urls.join(","),order_id:orderid,star_level:starLevel,evaluation:evaluation};
        console.log(params);
        $http.get("__ROOT__/api.php/Evaluation/add", {params:params})
        .success(function(data){
            console.log(data);
            if (data.status ==='success') {
                //将订单变为已评论
                OrderFactory.orderIsEvaluationed(orderid);
                $state.go('tabs.success');
            }
            else{
                $ionicPopup.alert({
                    title: '系统错误',
                    template: data.message,
                });
            }
        })
        .error(function(res){
            $ionicPopup.alert({
                title: '网络错误',
                template: "网络状态不佳，请您稍后重试",
            });
        });
    };
});