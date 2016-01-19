<!DOCTYPE html>
<html ng-app="yunzhiclub">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

  <link href="__LIB__/ionic/css/ionic.css" rel="stylesheet">
  <link href="__CSS__/style.css" rel="stylesheet">

  <!-- ionic/angularjs js -->
  <script src="__LIB__/ionic/js/ionic.bundle.js"></script>
  <script src="__JS__/ionic-datepicker.bundle.min.js"></script>

  <!-- your app's js -->
  <script src="{:U('indexApp.js')}"></script>
   <!-- <script src="__JS__/app.js"></script>
   <script src="__JS__/controllers.js"></script> -->
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=U7N6PIKHKGEKgXmi5wqNfItn"></script>

 </head>
 <body>
  <ion-nav-bar class="bar-stable">
    <ion-nav-back-button>
    </ion-nav-back-button>
  </ion-nav-bar>
<ion-nav-view></ion-nav-view>
<!-- include -->
<include file="indexHotel" />
<include file="indexTabs" />
<include file="indexHome" />
<include file="indexRim" />
<include file="indexFullTime" />
<include file="indexDate" />
<include file="indexConfirmOrder" />

<include file="indexHotel" />
<include file="indexEvaluation" />
<include file="indexEvaluationing" />
<include file="indexSuccess" />
<include file="indexActivity" />
<include file="indexActivityDetails" />
<include file="indexPersonalCenter" />
<include file="indexToBePaid" />
<include file="indexToBeStay" />
<include file="indexToBeEvaluation" />
<include file="indexIntegral" />
<include file="indexAllOrder" />
<include file="indexPaySuccess" />
<include file="indexPayError" />
</body>


</html>


