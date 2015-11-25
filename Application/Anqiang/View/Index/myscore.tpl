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
    <h1 class="title">我的积分</h1>
  </div>
  <div class="scroll-content has-header jifen">
    <img src="__IMG__/arrow.jpg" class="full-image">
    <h4 style="text-align:center">
      积分介绍
    </h4>
    <hr style="solid 1px gray" />

  </div>




<div class="tabs tabs-icon-top tabs-positive" style="padding-top:0px;">
  <a class="tab-item">
    <i class="icon ion-home"></i>
    首页
  </a>
 
  <a class="tab-item">
    <i class="icon ion-ios-person"></i>
    个人中心
  </a>
</div>









</body>
</html>


  <style>
    .jifen
    {
      margin-top: 30px;
    }

  </style>