<script id="templates/indexRim.html" type="text/ng-template">
<ion-view view-title="搜周边" ng-controller="rimCtrl">
   <ion-content>
        <div class="row">
            <div id="rimMap" class="col col-100" style="height:600px;"></div>
        </div>
    </ion-content>
    <ion-footer-bar align-title="left" class="bar-subfooter" style="margin-bottom:5px;" >
        <div class="button-bar bar-stable">
            <a ng-repeat="keyword in keywords" ng-click="keyworkChang(keyword)" class="button {{keyword.classTitle}}">{{keyword.title}}</a>
        </div>
    </ion-footer-bar>
    <style type="text/css">

    </style>
</ion-view>
</script>