var app = angular.module('yunzhiclub', ['ionic','ionic-datepicker']);



app.config(function($stateProvider, $urlRouterProvider,$ionicConfigProvider){
    //用$ionicConfigProvider解决了安卓手机上的导航在顶部的bug
    $ionicConfigProvider.platform.ios.tabs.style('standard');
    $ionicConfigProvider.platform.ios.tabs.position('bottom');
    $ionicConfigProvider.platform.android.tabs.style('standard');
    $ionicConfigProvider.platform.android.tabs.position('standard');

    $ionicConfigProvider.platform.ios.navBar.alignTitle('center');
    $ionicConfigProvider.platform.android.navBar.alignTitle('left');

    $ionicConfigProvider.platform.ios.backButton.previousTitleText('').icon('ion-ios-arrow-thin-left');
    $ionicConfigProvider.platform.android.backButton.previousTitleText('').icon('ion-android-arrow-back');

    $ionicConfigProvider.platform.ios.views.transition('ios');
    $ionicConfigProvider.platform.android.views.transition('android');
    $stateProvider
    .state('tabs',
    {
      url: "/tab",
      abstract: true,
      templateUrl: "templates/indexTabs.html"
    })
    .state('tabs.home',{
      url: "/home",
      views:{
        	//首页
          'home-tab':{
            templateUrl: "templates/indexHome.html",
            controller: "HomeTabCtrl"
          }
        }
      })
    .state('tabs.evaluation',{
      url: "/evaluation",
      views:{
        	//首页的查看评论
          'home-tab':{
            templateUrl: "templates/indexEvaluation.html"
          }
        }
      })
    .state('tabs.evaluationing',{
      url: "/evaluationing",
      views:{
        	//评论界面
          'home-tab':{
            templateUrl: "templates/indexEvaluationing.html"
          }
        }
      })
    .state('tabs.success',{
      url: "/success",
      views:{
            //评论成功
            'home-tab':{
              templateUrl: "templates/indexSuccess.html"
            }
          }
        })
    .state('tabs.integral1',{
      url: "/integral1",
      views:{
            //我的积分
            'home-tab':{
              templateUrl: "templates/indexIntegral.html"
            }
          }
        })
    .state('tabs.paySuccess1',{
      url: "/paySuccess1",
      views:{
            //支付成功
            'home-tab':{
              templateUrl: "templates/indexPaySuccess.html"
            }
          }
        })
    .state('tabs.date',{
      url: "/date",
      views:{
            //选择日期
            'home-tab':{
              templateUrl: "templates/indexDate.html"
            }
          }
        })
    .state('tabs.hotel',{
      url: "/hotel",
      views:{
            //酒店介绍
            'home-tab':{
              templateUrl: "templates/indexHotel.html"
            }
          }
        })
    .state('tabs.confirmOrder',{
      url: "/confirmOrder",
      views:{
            //填写订单
            'home-tab':{
              templateUrl: "templates/indexConfirmOrder.html"
            }
          }
        })
    .state("tabs.rim",{
      url: "/rim",
      views: {
        "rim-tab":{
            	//搜周边
              templateUrl: "templates/indexRim.html"
            }
          }
        })
    .state("tabs.activity",{
      url: "/activity",
      views: {
        "activity-tab":{
            	//活动
              templateUrl: "templates/indexActivity.html"
            }
          }
        })
    .state("tabs.activityDetail",{
      url: "/activityDetail",
      views: {
        "activity-tab":{
                //活动详情
                templateUrl: "templates/indexActivityDetails.html"
              }
            }
          })
    .state('tabs.personal', {
      url: "/personal",
      views: {
        'personal-tab': {
        	//个人中心
          templateUrl: "templates/indexPersonalCenter.html"
        }
      }
    })
    .state('tabs.toBePaid', {
      url: "/toBePaid",
      views: {
        'personal-tab': {
            //待支付
            templateUrl: "templates/indexToBePaid.html"
          }
        }
      })
    .state('tabs.toBeEvaluation', {
      url: "/toBeEvaluation",
      views: {
        'personal-tab': {
            //待评价
            templateUrl: "templates/indexToBeEvaluation.html"
          }
        }
      })
    .state('tabs.toBeStay', {
      url: "/toBeStay",
      views: {
        'personal-tab': {
            //待入住
            templateUrl: "templates/indexToBeStay.html"
          }
        }
      })
    .state('tabs.paySuccess', {
      url: "/paySuccess",
      views: {
        'personal-tab': {
            //支付成功
            templateUrl: "templates/indexPaySuccess.html"
          }
        }
      })
    .state('tabs.evaluationing1', {
      url: "/evaluationing1",
      views: {
        'personal-tab': {
            //个人中心待评价的评价界面
            templateUrl: "templates/indexEvaluationing.html"
          }
        }
      })
    .state('tabs.success1',{
      url: "/success",
      views:{
            //个人中心待评价的评论成功
            'home-tab':{
              templateUrl: "templates/indexSuccess.html"
            }
          }
        })
    .state('tabs.allOrder', {
      url: "/allOrder",
      views: {
        'personal-tab': {
            //我的订单
            templateUrl: "templates/indexAllOrder.html"
          }
        }
      })
    .state('tabs.integral2', {
      url: "/integral2",
      views: {
        'personal-tab': {
            //我的积分
            templateUrl: "templates/indexIntegral.html"
          }
        }
      });
    $urlRouterProvider.otherwise("/tab/home");
  });

app.controller("HomeTabCtrl", ['$scope', function(){
  console.log('HomeTabCtrl');
}]);

app.controller("EvaluationingCtrl", function($scope,$http){
  console.log('EvaluationingCtrl');
  $scope.upload = function(){
    $http.get('api.php/Index/getJssdk')
    .success(function(data,status){
     wx.config({
      debug: true,
      appId:  data["appId"],
      timestamp: data["timestamp"],
      nonceStr: data["nonceStr"],
      signature: data["signature"],
      jsApiList: [
      // 所有要调用的 API 都要加到这个列表中
      'previewImage','uploadImage','downloadImage'
      ]
    });
     wx.ready(function () {
    // 在这里调用 API
    //上传图片
    // wx.uploadImage({
    // localId: '', // 需要上传的图片的本地ID，由chooseImage接口获得
    // isShowProgressTips: 1, // 默认为1，显示进度提示
    // success: function (res) {
    //     var serverId = res.serverId; // 返回图片的服务器端ID
    //   }
    // });
    //选择图片
    wx.chooseImage({
    count: 1, // 默认9
    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
    success: function (res) {
        //var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
        alert('localIds')
      }
    });
  });
   }).error(function(data,status){

   });
 };
});

app.controller('SlideCtrl', function($scope,$timeout,$http) {
  $http.get('api.php/Api/Api/getSlideInit')
   .success(function(data){
      if(data.slideUrls.status==='success'){
        $scope.slideUrls = data.slideUrls.data;
      }else{
      alert("幻灯片数据错误");
      }
      if(data.slideMapUrl.status==='success'){
        $scope.slideMapUrl = data.slideMapUrl.data;
      }else{
      alert("地图数据错误");
      }
      if(data.rooms.status==='success'){
        $scope.rooms = data.rooms.data;
      }else{
      alert("房间数据错误");
      }
    })
   .error(function(data,status){
      alert("没有该方法");
   });
  $scope.toggleDetail = function(room){
    room.detail = !room.detail;
    room.order = '';
    $timeout(function(){
     room.order = '#/tab/confirmOrder';
    },100);
  }
   
 
});

app.controller('IntroductionCtrl', function($scope,$http) {
    $http.get('api.php/Api/Api/getHotelIntroduction')
     .success(function(data,status){
      if(data.status==='success'){
        $scope.introduction = data.data;
      }else{
      alert("幻灯片数据错误");
      }
      })
     .error(function(data,status){
      
     });
});

app.controller('EvaluationCtrl', function($scope,$http,$q) {
  
  var page = 1;
  var moreData = [];
  $scope.evaluations = [];
  $scope.moreDataCanBeLoaded = true;
  var canBeLoaded = function (moreData) {
    if (moreData.length == 0) {
      $scope.moreDataCanBeLoaded = false;
    }else{
      $scope.moreDataCanBeLoaded = true;
    }
  }
  var getJosn = function (page){
      var deferred = $q.defer();
        $http.get('api.php/Api/Api/getEvaluation',{params:{p:page,pagesize:'2'}})
          .success(function(data,status){
            if(data.status==='success'){
              moreData = data.data;
              console.log(moreData);
              deferred.resolve(data.data);
              if ($scope.evaluations.length == 0) {
                $scope.evaluations = data.data;
                console.log($scope.evaluations);
              }else{
                for (var i = 0; i < data.data.length; i++) {
                  $scope.evaluations.push(data.data[i]);
                }
                console.log($scope.evaluations);
              }
            }else{
              alert('评论数据不正确');
            }
          });
          return deferred.promise;
      };
    $scope.loadMoreData = function () {
      getJosn(page++).then(function () {
      canBeLoaded(moreData);
      return $scope.moreDataCanBeLoaded;
      console.log($scope.moreDataCanBeLoaded);
      }).then(function (data) {
        $scope.$broadcast('scroll.infiniteScrollComplete');
      });
    };
   
});

app.controller('DateCtrl',function($scope){
 });

app.controller('FinishCtrl',function($scope){
  $scope.datePickerCallback = function (val) {
  if (typeof(val) === 'undefined') {
    console.log('No date selected');
  } else {
    console.log('Selected date is : ', val);
    $scope.datepickerObject.inputDate = new Date(val);
    $scope.maxDay = new Date(val); 
  }
};
});

//活动列表
app.controller('ActivityCtrl',function($scope,$http){
    $http.get('api.php/Api/Api/getActivityLists')
     .success(function(data,status){
      if(data.status == 'success'){
        $scope.activitys = data.data;
      }
      else{
        alert('数据不正确');
      }
      })
     .error(function(data,status){
        
     });
});

app.directive("star", function() {
   return {
    template: '<h1><ul class="rating" ng-mouseleave="leave()">' +
        '<li ng-repeat="star in stars" ng-class="star" ng-click="click($index + 1)" ng-mouseover="over($index + 1)">' +
        '\u2605' +
        '</li>' +
        '</ul></h1>',
    scope: {
      ratingValue: '=',
      max: '=',
      readonly: '@',
      onHover: '=',
      onLeave: '='
    },
    controller: function($scope){
      $scope.ratingValue = $scope.ratingValue || 0;
      $scope.max = $scope.max || 5;
      $scope.click = function(val){
        if ($scope.readonly && $scope.readonly === 'true') {
          return;
        }
        $scope.ratingValue = val;
      };
      $scope.over = function(val){
        $scope.onHover(val);
      };
      $scope.leave = function(){
        $scope.onLeave();
      }
    },
    link: function (scope, elem, attrs) {
      elem.css("text-align", "center");
      var updateStars = function () {
        scope.stars = [];
        for (var i = 0; i < scope.max; i++) {
          scope.stars.push({
            filled: i < scope.ratingValue
          });
        }
      };
      updateStars();
 
      scope.$watch('ratingValue', function (oldVal, newVal) {
        if (newVal) {
          updateStars();
        }
      });
      scope.$watch('max', function (oldVal, newVal) {
        if (newVal) {
          updateStars();
        }
      });
    }
  };
});
app.controller('EvaluationingCtrl',function($scope){
  $scope.max = 5;
  $scope.ratingVal = 2;
  $scope.readonly = false;
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
});

app.controller('MapCtrl', function() {
 // 百度地图API功能
 var map = new BMap.Map("allmap");
 var point = new BMap.Point(117.223579,39.119671);
 map.centerAndZoom(point,12);
  // 创建地址解析器实例
  var myGeo = new BMap.Geocoder();
  // 将地址解析结果显示在地图上,并调整地图视野
  myGeo.getPoint("天津市河西区凯德国贸中心C座（近小白楼地铁站C出口）", function(point){
    if (point) {
      map.centerAndZoom(point, 16);
      map.addOverlay(new BMap.Marker(point));
    }else{
      alert("您选择地址没有解析到结果!");
    }
  }, "天津市");
});



