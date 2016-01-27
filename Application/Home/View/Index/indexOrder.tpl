<script id="templates/indexOrder.html" type="text/ng-template">
<ion-view view-title="{{title}}" ng-controller="order">
<ion-content>
        <div class="list">
            <div class="item item-thumbnail-left" href="#" ng-repeat="order in orders track by $index">
                <img src="__IMG__/jiudian.jpg">
                <h2>价格：￥99.9</h2>
                <h2>介绍:大床房</h2>
                <h2>入住时间:2015.11.23</h2>
                <button ng-click="pay(order)" ng-if="order.toBePaid">立即支付</button>
                <button ng-if="order.toBeEvaluation">评价赢积分</button>
            </div>
        </div>      
    </div>
</ion-content>
</ion-view>
</script>