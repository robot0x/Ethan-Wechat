wx.config({
jsapiTicket: "{$M->signPackage['jsapiTicket']}",
      debug: true,
      appId:  "{$M->signPackage['appId']}",
      timestamp: "{$M->signPackage['timestamp']}",
      nonceStr: "{$M->signPackage['nonceStr']}",
      signature: "{$M->signPackage['signature']}",
      url: location.href.split('#')[0],
      jsApiList: [
      // 所有要调用的 API 都要加到这个列表中
      'previewImage','uploadImage','downloadImage','chooseImage','openLocation', 'getLocation','chooseWXPay'
      ]
     });
var app = angular.module('yunzhiclub', ['ionic']);
var openId = "{$M->openId}";
var url = "{$M->signPackage['url']}";
app.config(function($stateProvider,$provide, $urlRouterProvider,$ionicConfigProvider){
    //用$ionicConfigProvider解决了安卓手机上的导航在顶部的bug
    $ionicConfigProvider.platform.ios.tabs.style('standard');
    $ionicConfigProvider.platform.ios.tabs.position('bottom');
    $ionicConfigProvider.platform.android.tabs.style('standard');
    $ionicConfigProvider.platform.android.tabs.position('standard');

    $ionicConfigProvider.platform.ios.navBar.alignTitle('center');
    $ionicConfigProvider.platform.android.navBar.alignTitle('left');
  
    //隐藏后台标题,设置后退图标,设置后退标题
    $ionicConfigProvider.platform.ios.backButton.previousTitleText('').icon('icon ion-shouye').previousTitleText(false);
    $ionicConfigProvider.platform.android.backButton.previousTitleText('').icon('icon ion-shouye').previousTitleText(false);

    //设置后退按钮标题为空
    $ionicConfigProvider.backButton.text('');
    
    $ionicConfigProvider.platform.ios.views.transition('ios');
    $ionicConfigProvider.platform.android.views.transition('android');
    

    //构建相应的factory
    $provide.factory('Home', function($http) {
      var service = {};
      service.getJosn = function () {
        return $http.get('api.php/Api/Api/getSlideInit');
      }
        return service;
    });

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
    .state('tabs.map',{
      url: "/map",
      views:{
          //首页的地图导航页面
          'home-tab':{
            templateUrl: "templates/indexMap.html"
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
    .state('pay', {
        url: "/pay/:orderid",
        templateUrl: "templates/indexPay.html"
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
      url: "/allOrder/:type",
      views: {
        'personal-tab': {
            //我的订单
            templateUrl: "templates/indexOrder.html"
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



  app.controller("EvaluationingCtrl", function($scope,$http){
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
  console.log('EvaluationingCtrl');
  $scope.upload = function(){
    $http.get('api.php/Index/getJssdk')
    .success(function(data,status){
     

     wx.ready(function () {
      // 在这里调用 API

      //选择图片
  var images = {
      localId: [],
      serverId: []
   };
       wx.chooseImage({
        success: function (res) {
            images.localId = res.localIds;
          alert('已选择 ' + res.localIds.length + ' 张图片');

            if (images.localId.length == 0) {
            alert('请先使用 chooseImage 接口选择图片');
            return;
        }
        var i = 0, length = images.localId.length;
        images.serverId = [];
        function upload() {
          wx.uploadImage({
            localId: images.localId[i],
            success: function (res) {
                i++;
                alert('已上传：' + i + '/' + length);
                images.serverId.push(res.serverId);
                if (i < length) {
                  upload();
                }
                 $http.get('api.php/Evaluation/uploadImage',{params:{openid:'oha4Tt-t_DrHCdmtvCkHOLO8ygTg',serverId:'gXX88LNvzZc3XVtNb8iYUmokK4O6IL4d8KuVdFnFAGb32EPUxjUKFjCX77hrgH2c'}})
                 .success(function(data,status){
                      //这里的data就是返回的文件名
                      alert(data);
                 })
            },
            fail: function (res) {
                alert(JSON.stringify(res));
            }
          });
      }
         upload();
         } 
     });
  
    
    });  
  })
  .error(function(data,status){

   });
 };
});


app.controller('SlideCtrl', function($scope,$timeout,Home,Calendar) {
  $scope.beginDate = Calendar.beginDate;
  $scope.endDate = Calendar.endDate;
  console.log($scope.endDate);
  $scope.total = Calendar.total;
  Home.getJosn().success(function(data) {
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
  });
  
  $scope.toggleDetail = function(room){
    room.detail = !room.detail;
    room.order = '';
    $timeout(function(){
     room.order = '#/tab/confirmOrder';
    },100);
  }
   
 
});


app.controller('IntroductionCtrl', function($scope,Home) {
  
     Home.getJosn().success(function(data){
      if(data.introduction.status==='success'){
        $scope.introduction = data.introduction.data;
      }else{
      alert("幻灯片数据错误");
      }
      });
     });
app.filter('trustHtml', function ($sce) {
  return function (input) {
      return $sce.trustAsHtml(input);
  }

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

//活动列表
app.controller('ActivityCtrl',function($scope,Home){
    
     Home.getJosn().success(function(data){
      if(data.activitys.status == 'success'){
        $scope.activitys = data.activitys.data;
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
<include file="indexHomeTabController.js" />     //首页
<include file="indexOrderController.js" />    //订单
<include file="indexMapController.js" />      //导航
<include file="indexCalendarController.js" /> //日期选择器
<include file="indexRimController.js" />      //搜周边
<include file="indexPayController.js" />      //支付
<include file="indexPersonalCenter.js" />     //个人中心

<include file="indexOrderFactory.js" />       //近三个月内的订单
<include file="indexCalendarFactory.js" />    //用户选择入住日期Factory
<include file="indexCustomerFactory.js"  />        //用户信息
<include file="indexRoomFactory.js" />             //房型信息