<include file="indexWxConfig.js" /><!--微信JSSDK-->
var app = angular.module('yunzhiclub', ['ionic']);
var openId = "{$M->openId}";
var url = "{$M->signPackage['url']}";
<include file="indexConfig.js" />
<include file="indexStateProvider.js" />
<include file="indexRun.js" />

   //构建相应的factory
    app.factory('Home', function($http) {
      var service = {};
      service.getJosn = function () {
        return $http.get('api.php/Api/Api/getSlideInit');
      }
        return service;
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
                 $http.get('api.php/Evaluation/uploadImage')
                 .success(function(data,status){
                      alert('data');
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

<include file="indexIntroductionCtrl.js" />

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
app.controller('ActivityCtrl',function($scope,ActivityFactory){
  $scope.activities = ActivityFactory.activities;
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
<include file="customerFactory.js"  />        //用户信息
<include file="indexMapController.js" />      //导航
<include file="indexCalendarController.js" /> //日期选择器
<include file="indexRimController.js" />      //搜周边
<include file="indexPayController.js" />      //支付
<include file="indexPersonalCenter.js" />     //个人中心
<include file="indexConfirmOrder.js" />       //订单填写
<include file="indexActivityDetailCtrl.js" /> //活动详情

<include file="indexOrderFactory.js" />       //近三个月内的订单
<include file="indexCalendarFactory.js" />    //用户选择入住日期Factory
<include file="indexCustomerFactory.js"  />   //用户信息
<include file="indexRoomFactory.js" />        //房型信息
<include file="indexActivityFactory.js" />    //活动信息

<include file="indexBaseService.js" />        //基础服务
<include file="function.js" />                //公共函数
