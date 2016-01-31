<script id="templates/indexOrder.html" type="text/ng-template">
<ion-view view-title="{{title}}" ng-controller="order">
<ion-content>
        <div class="list">
            <div class="item item-thumbnail-left" href="#" ng-repeat="order in orders | orderBy:'order_time':true">
                <img ng-src="{{getFirstUrl(rooms[order.room_id].url)}}">
                <h2>房型：{{rooms[order.room_id].name}}({{order.count}}间)</h2>
                <p>单价：{{fenToYuan(order.price)}}元</p>
                <p>入住时间：{{order.begin_time_str}}</p>
                <p>退房时间：{{order.end_time_str}}</p>
                <a class="" data-ui-sref-opts="{cache: false,reload:true}" data-ui-sref="pay({orderid:order.id})" ng-if="order.toBePaid">立即支付</a>
                <a ui-sref="tabs.evaluationing({orderid:order.id})" ng-if="order.toBeEvaluation">评价赢积分</a>
            </div>
        </div>   

    </div>
</ion-content>
</ion-view>
</script>