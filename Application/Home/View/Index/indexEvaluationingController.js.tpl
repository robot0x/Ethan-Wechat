  app.controller("EvaluationingCtrl", function($scope,$http, $ionicLoading){
    $scope.max = 5;                   //最大?
    $scope.ratingVal = 2;             //??
    $scope.readonly = false;          //只读属性
    $scope.localIds = new Array();    //用户上传后的图片本地URL
    var serverIds = new Array();           //用于服务器取微信服务器暂存的图片
    var maxCount = 5;                 //最多上传照片数
    $scope.showUpload = 1;            //是否显示上传按钮
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
      alert($scope.ratingVal);
    }

    //上传图片至微信服务器
    var upload = function(localIds){
        var length = localIds.length;
        localIds.forEach(function(localId, index){
            wx.uploadImage({
                localId: localId,       // 需要上传的图片的本地ID，由chooseImage接口获得
                isShowProgressTips: 1,  // 默认为1，显示进度提示
                success: function (res) {
                    serverIds.push(res.serverId); // 返回图片的服务器端ID
                    console.log(serverIds)
                    maxCount--;
                    if (maxCount <= 0)
                    {
                        $scope.showUpload = 0;
                    }
                    if (index == length-1)
                    {
                        $ionicLoading.hide();
                    }
                },
                error:function(res){
                    $ionicLoading.hide();   
                },
            });
        });
    };

    //用户点击上传图片
    $scope.upload = function(){
        $ionicLoading.show({template: '<ion-spinner></ion-spinner>'});
        wx.ready(function () {
            wx.chooseImage({
                count: maxCount, //最大上传数量
                success: function (res) {
                    console.log('已选择 ' + res.localIds.length + ' 张图片');
                    res.localIds.forEach(function(element){
                        $scope.localIds.push(element);
                    });
                    upload(res.localIds); //上传图片
                },
                error: function(res){
                    $ionicLoading.hide();
                }
            });
        }); 
    }; 

    //提交评论
    $scope.submit = function(){
        var params = {serverIds:serverIds.join(",")};
        $http.get("__ROOT__/api.php/Evaluation/add", {params:params})
        .success(function(res){
            console.log(res);
            return false;//数据传出无问题后，注释该行.
        })
        .error(function(){

        });
    };
});