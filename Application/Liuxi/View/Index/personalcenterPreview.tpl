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
  <div class="bar bar-header bar-dark">
    <a href="" class="button button-icon icon ion-close-round"></a>
    <h1 class="title">洛克酒店个人中心</h1>
  </div>

  <div class="bar bar-subheader bar">
   <a class="button icon-left ion-chevron-left button-clear button-dark"></a>
  <h1 class="title">手机号</h1>
    <a href="#/app/capture" class="button button-icon icon ion-gear-a"></a>
  </div>
 
  <div class="bar bar-footer bar-stable row">
    <div class="col">预订酒店</div>
    <div class="col">搜周边</div>
    <div class="col">活动</div>
  </div>
</body>
</html>
