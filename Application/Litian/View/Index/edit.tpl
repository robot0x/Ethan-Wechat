<!DOCTYPE html>
<html>
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

  <body ng-app="starter">
    <ion-pane>
      <!-- header -->
      <ion-header-bar class="bar-stable">
        <div class="bar bar-header bar-positive">
          <a href="" class="button button-icon icon ion-chevron-left"></a>
            <h4 class="tittle">确认订单</h4>
        </div>
      </ion-header-bar>
      <!-- content -->
      <ion-content class="bar-content">
        <div class="button button-clear button-positive button-right">完成</div>

        <ul class="list">
          <li class="item item-checkbox">
             <label class="checkbox">
               <input type="checkbox">
             </label>
             <div class="item item-thumbnail-left" style="margin-right: 30px;" href="#">
                <img src="__IMG__/big.jpg">
                <h2>房型：大床房</h2>
                <p>价格：365.00</p>
                <p>介绍：有窗/空调/电视/wifi</p>
                <p>入住时间：2015.11.25</p>

              </div>
              <div class="button button-small button-assertive" style="margin-left: 214px; margin-top: -72px;">删除</div>
          </li>
          <li class="item item-checkbox">
             <label class="checkbox">
               <input type="checkbox">
             </label>
             <div class="item item-thumbnail-left" style="margin-right: 30px;" href="#">
                <img src="__IMG__/big.jpg">
                <h2>房型：大床房</h2>
                <p>价格：365.00</p>
                <p>介绍：有窗/空调/电视/wifi</p>
                <p>入住时间：2015.11.25</p>

              </div>
              <div class="button button-small button-assertive" style="margin-left: 214px; margin-top: -72px;">删除</div>
          </li>
          <li class="item item-checkbox">
             <label class="checkbox">
               <input type="checkbox">
             </label>
             <div class="item item-thumbnail-left" style="margin-right: 30px;" href="#">
                <img src="__IMG__/big.jpg">
                <h2>房型：大床房</h2>
                <p>价格：365.00</p>
                <p>介绍：有窗/空调/电视/wifi</p>
                <p>入住时间：2015.11.25</p>

              </div>
              <div class="button button-small button-assertive" style="margin-left: 214px; margin-top: -72px;">删除</div>
          </li>
        </ul>
      </ion-content>

    </ion-pane>
  </body>
</html>
