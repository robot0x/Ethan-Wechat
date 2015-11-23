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
    <h1 class="title">南京路百度全景预览</h1>
  </div>
  <div class="bar bar-subheader bar-stable">
    <a href="" class="button button-icon icon ion-chevron-left"></a>
    <h1 class="title">南京路</h1>
  </div>
  <div><img class="full-image" src="nanjing.jpg"></div>
  <div class="bar bar-footer bar-stable row">  
    <button class="button button-outline button-positive">MAP</button> 
  </div>
</body>
</html>
