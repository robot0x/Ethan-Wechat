<!DOCTYPE html>
<html ng-app="yunzhiclub">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
  <title></title>

  <link href="__LIB__/ionic/css/ionic.css" rel="stylesheet">
  <link href="__CSS__/style.css" rel="stylesheet">

    <!-- IF using Sass (run gulp sass first), then uncomment below and remove the CSS includes above
    <link href="css/ionic.app.css" rel="stylesheet">
  -->


  <!-- ionic/angularjs js -->
  <script src="__LIB__/ionic/js/ionic.bundle.js"></script>

  <!-- your app's js -->
  <script src="__JS__/app.js"></script>

</head>
<body ng-controller="MyCtrl">

<div class="bar bar-header bar-positive">
  <a href="#/app/capture" class="button button-icon icon ion-chevron-left"></a>
  <h1 class="title">个人中心</h1>
  <a href="#/app/capture" class="button button-icon icon ion-gear-a"></a>
</div>

<ion-content class="no-header">
<div class="list">
  <a class="item item-avatar" href="#">
    <img src="__IMG__/1024.jpg">
    <h6>用户名</h6>
    <p><h6>手机号</h6></p>
  </a>

  <div class="button-bar" style="height:42px;">
    <a class="button button-light" href="#" style="padding-bottom: 35px;"><span class="stress1">待支付</span> <span class="badge badge-assertive" style="padding: 1px 2px;">0</span> </a>
    <a class="button button-light" href="#" style="padding-bottom: 35px;"><span class="stress2">待评价</span> <span class="badge badge-assertive" style="padding: 1px 2px;">0</span> </a>
    <a class="button button-light" href="#" style="padding-bottom: 35px;"><span class="stress3">待入住</span> <span class="badge badge-assertive" style="padding: 1px 2px;">0</span> </a>
  </div>

  <a class="item item-icon-right" href="#"  style="padding-top: 10px; padding-bottom: 10px;">
    <span class="stress4">全部订单</span>
    <i class="icon ion-ios-arrow-right"  style="font-size:18px; height: 46px;"></i>
  </a>
  <a class="item item-icon-right" href="#"  style="padding-top: 10px; padding-bottom: 10px;">
    <span class="stress5">查看积分</span>
    <i class="icon ion-ios-arrow-right"  style="font-size:18px; height: 46px;"></i>
  </a>
  <a class="item item-icon-right" href="#"  style="padding-top: 10px; padding-bottom: 10px;">
    <span class="stress6">客服  ********</span>
    <i class="icon ion-ios-arrow-right"  style="font-size:18px; height: 46px;"></i>
  </a>
</div>
</ion-content>

<div class="tabs tabs-icon-top tabs-positive">
  <a class="tab-item">
    <i class="icon ion-home"></i>
      首页
  </a>
  <a class="tab-item">
    <i class="icon ion-location"></i>
      搜周边
  </a>
  <a class="tab-item">
    <i class="icon ion-ios-list"></i>
      活动
  </a>
  <a class="tab-item">
    <i class="icon ion-person"></i>
      个人中心
  </a>
</div>
</body>
</html>

<style type="text/css">
.list{
  margin-top:43px;
}
.stress1, .stress4{
  font-size:10px;
}
.stress2, .stress5{
  font-size:10px;
}
.stress3, .stress6{
  font-size:10px;
}

.tabs .tab-item .badge.badge-assertive, .badge.badge-assertive
{
    font-size: 5px;
    font-weight: ;
    line-height: 5px;
    min-width: 5px;
}
</style>