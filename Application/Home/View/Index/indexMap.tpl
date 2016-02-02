<script id="templates/indexMap.html" type="text/ng-template">
<ion-view view-title="洛克高级酒店公寓" class="map" >
<div class="bar bar-header">
  <a ng-href='#/tab/home'><button class="button button-icon icon ion-ios-arrow-back"></button></a>
  <div class="h1 title">地图</div>
</div>
<ion-content class='has-header' ng-controller="MapCtrl">
        <div class="row maprow">
            <div id="allmap" class="col col-100"></div>
        </div>
        <div class="row maprow">
            <div id="result" class="col col-100"></div>
        </div>
    <include file="indexMap.css" />
</ion-content>
</ion-view>
</script>
