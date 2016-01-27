<script id="templates/indexPay.html" type="text/ng-template">
<ion-view view-title="支付" ng-controller="indexPayController">
    <ion-content>
        <div class="list">
            <div class="item item-avatar">
              <img src="__IMG__/success.png">
              <h2 class="success">{{message}}</h2>
              <p>恭喜您！！获得5积分！！</p>
              <a href="">查看积分>></a>
            </div>
            <div class="item item-avatar">
              <img src="__IMG__/success.png">
              <h2 class="success">{{message}}</h2>
              <p>恭喜您！！获得5积分！！</p>
              <a href="">查看积分>></a>
            </div>
            <div class="item item-avatar">
              <img src="__IMG__/success.png">
              <h2 class="success">{{message}}</h2>
              <p>恭喜您！！获得5积分！！</p>
              <a href="">查看积分>></a>
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
