<script id="templates/indexOrder.html" type="text/ng-template">
<ion-view view-title="洛克高级酒店公寓" ng-controller="order">
<div class="bar bar-header">
  <a ng-href='#/tab/personal'><button class="button button-icon icon ion-ios-arrow-back"></button></a>
  <div class="h1 title">{{title}}</div>
</div>
<ion-content>
        <div class="list has-header">
            <div class="item item-thumbnail-left" href="#" ng-repeat="order in orders | orderBy:'order_time':true">
                <img ng-src="{{getFirstUrl(rooms[order.room_id].url)}}">
                <h2>房型：{{rooms[order.room_id].name}}({{order.count}}间)</h2>
                <p>单价：{{order.price*order.totalDays*order.count | fenToYuan}}元</p>
                <p>入住时间：{{order.begin_time_str}}</p>
                <p>退房时间：{{order.end_time_str}}</p>
                <a class="button button-small button-balanced" data-ui-sref-opts="{cache: false,reload:true}" data-ui-sref="pay({orderid:order.id})" ng-if="order.toBePaid">立即支付</a>
                <a class="button button-small button-positive" ui-sref="tabs.evaluationing({orderid:order.id})" ng-if="order.toBeEvaluation">评价赢积分</a>
            </div>
        </div>   

    </div>
</ion-content>
</ion-view>
</script>