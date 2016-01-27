<script id="templates/indexPay.html" type="text/ng-template">
<ion-view view-title="支付" ng-controller="indexPayController">
    <ion-content>
        <div class="list">
            <div class="item item-avatar" ng-show="paying">
              <img src="__IMG__/success.png">
              <h2 class="success">正在支付</h2>
              <p>正在为您跳转，请稍后{{waitTime}}</p>
            </div>
            <div class="item item-avatar" ng-show="fail">
              <img src="__IMG__/success.png">
              <h2 class="success">支付失败</h2>
              <p>正在为您跳转，请稍后{{waitTime}}</p>
            </div>
            <div class="item item-avatar" ng-show="success">
              <img src="__IMG__/success.png">
              <h2 class="success">支付成功</h2>
              <p>正在为您跳转，请稍后{{waitTime}}</p>
            </div>
            <a class="item item-thumbnail-left" href="#">
                <img src="__IMG__/big.jpg">
                <h2>房型：大床房</h2>
                <p>价格：365.00</p>
                <p>介绍：空调/电视/wifi</p>
                <p>入住时间：2015.11.25</p>
            </a>
        </div>
        <a ui-sref="tabs.home">确定</a>
    </ion-content>
</ion-view>
</script>
