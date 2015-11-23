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
<!-- 图片轮播 -->
<div></div>
<!-- 各大网站好评 -->
<div></div>
<!-- 酒店介绍 -->
<div class="list">
    <a class="item item-body" href="#">
      <img src="cover.jpg">
      <h2>酒店介绍</h2>
      <p>洛克公寓，本来生活。洛克高级酒店公寓位于天津市和平区南京路凯德国贸C座，紧邻小白楼地铁站C口及CBD核心商圈，是您旅游度假和商旅的优质选择。</p>
    </a>
</div>
  <div class="bar bar-footer bar-stable row">
    <div class="col">酒店预订</div>
    <div class="col">搜周边</div>    
    <div class="col">活动</div>
    <div class="col">个人中心</div>  
  </div>
</body>
</html>
