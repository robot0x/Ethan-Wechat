<script id="templates/indexPay.html" type="text/ng-template">
    <ion-view view-title="洛克高级酒店公寓" hide-nav-bar="true">
    <div class="bar bar-header">
        <a ng-href='#/tab/personal'><button class="button button-icon icon ion-ios-arrow-back"></button></a>
        <div class="h1 title">支付</div>
    </div>
        <ion-content class='has-header'>
            <div class="pay">
                <div class="paying" ng-hide="success || error">
                    <div class="payIcon">
                        <ion-spinner icon="ripple"></ion-spinner>
                    </div>
                    <h2>请稍候</h2>
                </div>
                <div class="success" ng-show="success">
                    <div class="payIcon">
                        <i class="icon ion-success"></i>
                    </div>
                    <h2>支付成功!</h2>
                    <h3><b><span class="assertive">￥&nbsp;</span>{{totalPrice}}</b></h3>
                </div>
                <div class="error" ng-show="error">
                    <div class="payIcon">
                        <i class="icon ion-error"></i>
                    </div>
                    <h2>支付失败</h2>
                    <p>{{message}}</p>
                </div>
            </div>
            <div class="item item-thumbnail-left">

                <img ng-src="{{room.url.split(',')[0]}}">
                <h2>房型：{{room.name}}</h2>
                <p>单价：{{order.price}}元</p>
                <p>介绍：{{room.description}}</p>
                <p>入住时间：{{order.begin_time_str}}</p>
                <p>退房时间：{{order.end_time_str}}</p>
            </div>

            <a on-click="reload" ng-show="success || error" ui-sref="tabs.home" ng-enable="isButtonOk">
                <button class="button button-block button-balanced">
                    完成
                </button></a>
        </ion-content>
    </ion-view>
</script>
