<script id="templates/indexHome.html" type="text/ng-template">
<ion-view view-title="首页" ng-controller="HomeTabCtrl">
   <ion-content>
<!-- 图片轮播 -->
      <ion-slide-box class="slides">
        <ion-slide class="box" ng-repeat="item in slideUrls">

            <img ng-src="{{item}}">

        </ion-slide>
      </ion-slide-box>
<!-- 酒店介绍 -->
<div class="list">
    <div class="item item-thumbnail row">
          <a href="#/tab/evaluation" class="col-33">
            <h1 class="energized">4.9分</h1>
            <h2 class="energized">棒极了</h2>
            <p>100%好评</p>
            <p>84条评论></p>
          </a>
        <a href="#/tab/map" class="col-67">
            <img class="full-image" ng-src="{{slideMapUrl}}">
        </a>
    </div>
      <a class="item row" href="#/tab/hotel">
        <i class="icon ion-shineiwifi col"></i>
        <i class="icon ion-wifi col"></i>
        <i class="icon ion-tingche col"></i>
        <i class="icon ion-feng col"></i>
        <i class="icon ion-24xiaoshireshui col"></i>
        <i class="icon ion-feiji2 col"></i>
        <i class="icon ion-right col"></i>
      </a>
    <a class="item item-button-right" href="#/tab/date">
    <i class="icon ion-rili"></i>
      {{beginDate}}至{{endDate}}
    <button class="button button-clear">
      <h3 class="positive">共{{total}}晚></h3>
    </button>
    </a>
    <div ng-repeat='room in rooms'>
  <a class="item" ng-href="{{room.order}}">
    <h2>{{room.name}}</h2>
    <p>{{room.description}}</p>
    <span ng-click='toggleDetail(room);' class="item-note energized">
      ￥{{fenToYuan(room.price)}}<i class="icon ion-down"></i>
    </span>
  </a>
  <div ng-show='room.detail' class="item">
      {{room.detail_description}}
      </div>
  </div>
<a class="item" href="tel:13920156607">
    <i class="icon ion-zhongdianfangbeijing"></i>
    钟点房
    <span class="item-note energized">
      3小时/￥91起
    </span>
  </a>
</div>
</ion-content>
</ion-view>

</script>
