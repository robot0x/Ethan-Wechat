<script id="templates/indexConfirmOrder.html" type="text/ng-template">
    <ion-view view-title="洛克高级酒店公寓" ng-controller='ConfirmOrderCtrl'>
        <div class="bar bar-header">
            <a ng-href='#/tab/home'><button class="button button-icon icon ion-ios-arrow-back"></button></a>
            <div class="h1 title">订单填写</div>
        </div>
        <form name='myForm'>
            <ion-content class='has-header' class="ion-content">
                <div class="list">
                    <div class='item'>
                        <span>预付须知：{{notice}}</span>
                    </div>
                    <a class="item item-thumbnail-left" href="#">
                        <img ng-src="{{room.url}}">
                        <h2>房型：{{room.name}}</h2>
                        <p>价格：{{fenToYuan(room.price)}}</p>
                        <p>描述：{{room.description}}</p>
                        <p>入住时间：{{beginTime}}至{{endTime}}</p>
                    </a>
                    <label class="item item-input">
                        <span class="input-label">房间数：</span>
                        <select ng-change="changValue(repeatSelect)" ng-options="count for count in counts" ng-model="repeatSelect">
                        </select>
                    </label>
                    <label class="item item-input">
                        <span class="input-label">到店时间：</span>
                        <input class='col-75' type="text" name="arriveTime" ng-model="arriveTime" required />
                        <p class='col-25' ng-show="myForm.arriveTime.$dirty && myForm.arriveTime.$invalid"><span class='dollar' ng-show="myForm.arriveTime.$error.required">时间必填</span></p>
                    </label>
                    <label class="item item-input">
                        <span class="input-label">入住人：</span>
                        <input class='col-75' type="text" name="name" ng-model="name" ng-change="changeName(name)" required />
                        <p class='col-25' ng-show="myForm.name.$dirty && myForm.name.$invalid"><span class='dollar' ng-show="myForm.name.$error.required">必填</span></p>
                    </label>
                    <label class="item item-input">
                        <span class="input-label">手机号：</span>
                        <input class='col-75' type="text" name="phone" ng-model="phone" ng-pattern="/^1[0-9]{10}$/" ng-change="changePhone(phone)" required />
                        <p class='col-25 dollar' ng-show="myForm.phone.$dirty && myForm.phone.$invalid">非法格式</p>
                    </label>
                    <div class="item">
                        <span class="danger">温馨提示：{{prompt}}</span>
                    </div>
                    <label ng-hide="1" class="item item-input">
                        <span class="input-label">完成支付并评价您将获得{{credit}}积分</span>
                    </label>
                </div>
            </ion-content>
            <ion-footer-bar align-title="left" class="">
                <h1 class="title">在线支付:<span class="dollar">￥{{totalPay}}</span></h1>
                <div class="buttons" ng-click="submitOrder()">
                    <button ng-disabled='myForm.$invalid' class="button button-positive">立即支付</button>
                </div>
            </ion-footer-bar>
        </form>
    </ion-view>
</script>
