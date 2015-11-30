<!DOCTYPE html>
<html ng-app='yunzhiclub'>
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

<body ng-controller='HideShowController'>
  <ion-pane>

  <!-- header -->
  <ion-header-bar class="bar-stable">
  <div
   class="bar bar-header bar-positive">
  <a href="#"  class="button button-icon icon ion-chevron-left"></a>
    <h4 class="tittle">待支付订单</h4>
  </div>
  <div class="bar bar-subheader row">
    <button ng-click='toggleMenu()' ng-model='name.text' class="button  button-{{name.color}} col col-33 col-offset-67">{{name.text}}</button>
  </div>
</ion-header-bar>
<!-- content -->
<ion-content class="bar-content has-subheader">


<div class="list">
  <div class="row">
    <div ng-show='menuState' class="col col-10">
      <label class="checkbox">
       <input type="checkbox">
     </label>
   </div>
   <div class="col {{col.text}}">
    <div class="item item-thumbnail-left" href="#">
      <img src="__IMG__/big.jpg">
      <h2>房型：大床房</h2>
      <p>价格：365.00</p>
      <p>介绍：空调/电视/wifi</p>
      <p>入住时间：2015.11.25</p>
      <div ng-hide='menuState' class="button button-small button-positive pull-right" style="margin: -61px 0px 0px 142px;">立即支付</div>
    </div>
  </div>
</div>

<div class="row">
  <div ng-show='menuState' class="col col-10">
    <label class="checkbox">
     <input type="checkbox">
   </label>
 </div>
 <div class="col {{col.text}}">
  <div class="item item-thumbnail-left" href="#">
    <img src="__IMG__/big.jpg">
    <h2>房型：大床房</h2>
    <p>价格：365.00</p>
    <p>介绍：空调/电视/wifi</p>
    <p>入住时间：2015.11.25</p>
    <div ng-hide='menuState' class="button button-small button-positive pull-right" style="margin: -61px 0px 0px 142px;">立即支付</div>
  </div>
</div>
</div>
</div>
</ion-content>
</ion-pane>
</body>
</html>
