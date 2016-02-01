<script id="templates/indexRim.html" type="text/ng-template">
<ion-view view-title="洛克高级酒店公寓" ng-controller="rimCtrl">
   <ion-content>
        <div class="row rimmap">
            <div id="rimMap" class="col col-100" style="min-height:100%"></div>
        </div>
    </ion-content>
    <ion-footer-bar align-title="left" class="bar-subfooter" style="margin-bottom:5px;" >
        <div class="button-bar bar-stable">
            <a ng-repeat="keyword in keywords" ng-click="keyworkChang(keyword)" class="button {{keyword.classTitle}}">{{keyword.title}}</a>
        </div>
    </ion-footer-bar>
    <style type="text/css">
    .rimmap{
        min-height:100%;
    }
    
    .scroll{
        height: 100% !important;
        display: -webkit-box !important;
        display: -moz-box !important;
        display: -ms-flexbox !important;
        display: -webkit-flex !important;
        display: flex !important;
        -webkit-box-direction: normal !important;
        -moz-box-direction: normal !important;
        -webkit-box-orient: vertical !important;
        -moz-box-orient: vertical !important;
        -webkit-flex-direction: column !important;
        -ms-flex-direction: column !important;
        flex-direction: column !important;
    }
    </style>
</ion-view>
</script>