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
  <a class="button icon-left ion-chevron-left button-clear button-white"></a>

  <h1 class="title">个人中心</h1>
  <a href="#/app/capture" class="button button-icon icon ion-gear-a"></a>
</div>
<ion-content class="no-header">
<div class="list">
  <a class="item item-avatar" href="#">
    <img src="__IMG__/1024.jpg">
    <h5>用户名</h5>
    <p><h5>手机号</h5></p>
  </a>

  <div class="button-bar">
    <a class="button button-light" href="#"><span class="stress1">待支付</span><span class="badge badge-assertive">0</span></a>
    <a class="button button-light" href="#"><span class="stress2">待评价</span><span class="badge badge-assertive">0</span></a>
    <a class="button button-light" href="#"><span class="stress3">待入住</span><span class="badge badge-assertive">0</span></a>
  </div>
  <div class="item" href="#">
    <h5>全部订单</h5>
  </div>
    <a class="item" href="#">
      <h5>查看积分</h5>
    </a>
    <a class="item" href="#">
      <h5>客服  ********</h5>
    </a>
</div>
</ion-content>

  <div class="bar bar-footer bar-positive bar-stable row">
    <div class="col"><h6>预订酒店</h6></div>
    <div class="col"><h6>搜周边</h6></div>
    <div class="col"><h6>活动</h6></div>
  </div>
</body>
</html>

<style type="text/css">
.list{
  margin-top:30px;
}
.stress1{
  font-size:10px;
}
.stress2{
  font-size:10px;
}
.stress3{
  font-size:10px;
}
</style>