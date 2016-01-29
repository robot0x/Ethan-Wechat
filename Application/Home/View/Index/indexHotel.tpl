<script id="templates/indexHotel.html" type="text/ng-template">
<ion-view view-title="酒店介绍" ng-controller="IntroductionCtrl">
    <ion-content>
        <div class="row">
            <div class="col">
              <div class="col-demo">
                <i class="ion-shineiwifi">房间WiFi</i>
              </div>
            </div>
            <div class="col">
              <div class="col-demo">
              <i class="ion-wifi">大堂WiFi</i>
              </div>
            </div>
            <div class="col">
              <div class="col-demo">
                <i class="ion-tingche">免费停车</i>
              </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
              <div class="col-demo">
                <i class="ion-feng">吹风机</i>
              </div>
            </div>
            <div class="col">
              <div class="col-demo">
              <i class="ion-24xiaoshireshui">全天热水</i>
              </div>
            </div>
            <div class="col">
              <div class="col-demo">
                <i class="ion-feiji2">免费接机</i>
              </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="col-demo">
                    <i class="ion-jinzhixiyan">无烟房</i>
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
