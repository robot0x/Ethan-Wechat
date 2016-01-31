<script id="templates/indexHotel.html" type="text/ng-template">
<ion-view ng-controller="IntroductionCtrl">
<div class="bar bar-header">
  <a ng-href='#/tab/home'><button class="button button-icon icon ion-ios-arrow-back"></button></a>
  <div class="h1 title">酒店介绍</div>
</div>
    <ion-content class='has-header'>
        <div class="row">
            <div class="col">
              <div class="col-demo">
                <i class="icon ion-shineiwifi">房间WiFi</i>
              </div>
            </div>
            <div class="col">
              <div class="col-demo">
              <i class="icon ion-wifi">大堂WiFi</i>
              </div>
            </div>
            <div class="col">
              <div class="col-demo">
                <i class="icon ion-tingche">免费停车</i>
              </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
              <div class="col-demo">
                <i class="icon ion-feng">吹风机</i>
              </div>
            </div>
            <div class="col">
              <div class="col-demo">
              <i class="icon ion-24xiaoshireshui">全天热水</i>
              </div>
            </div>
            <div class="col">
              <div class="col-demo">
                <i class="icon ion-feiji2">免费接机</i>
              </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="col-demo">
                    <i class="icon ion-jinzhixiyan">无烟房</i>
                </div>
            </div>
        </div>
        <div class="padding">
            <p>
                <a href="tel:18920909195" class="button button-block button-outline button-positive">酒店电话：{{introduction.hotel_phone}}</a>
            </p>
        </div>
        <div class="padding">
            <h4 class="basetext">酒店介绍</h4>
            <p ng-bind-html="introduction.description | trustHtml"></p>
        </div>
    </ion-content>
</ion-view>
</script>
