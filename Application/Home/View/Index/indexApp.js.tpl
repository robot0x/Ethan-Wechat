<include file="indexWxConfig.js" /><!--微信JSSDK-->
var app = angular.module('yunzhiclub', ['ionic']);
var openId = "{$M->openId}";
var url = "{$M->signPackage['url']}";
<include file="indexConfig.js" />
<include file="indexStateProvider.js" />
<include file="indexRun.js" />
<include file="indexEvaluationingController.js" />//评论


<include file="indexFilter.js" />//fileter



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
        $http.get('api.php/Api/Api/getEvaluation',{params:{p:page,pagesize:'10'}})
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
<include file="indexHotelController.js" /> //酒店介绍

<include file="indexOrderFactory.js" />       //近三个月内的订单
<include file="indexCalendarFactory.js" />    //用户选择入住日期Factory
<include file="indexCustomerFactory.js"  />   //用户信息
<include file="indexRoomFactory.js" />        //房型信息
<include file="indexActivityFactory.js" />    //活动信息
<include file="indexHomeFactory.js" />        //首页数据
<include file="indexHotelFactory.js" />       //酒店介绍数据
<include file="indexTimeRoomFactory.js" />    //首页小时房信息
<include file="indexCreditFactory.js" />    //客户总积分信息


<include file="indexBaseService.js" />        //基础服务
<include file="function.js" />                //公共函数
