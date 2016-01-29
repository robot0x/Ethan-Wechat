<script id="templates/indexConfirmOrder.html" type="text/ng-template">
<ion-view view-title="订单填写" ng-controller='ConfirmOrderCtrl'>
  <ion-content class="ion-content">
  <form name='myForm'>
    
    <div class="list">
    <div>
      <h4 class="tittle">预付须知：{{notice}}</h4>
    </div>
      <a class="item item-thumbnail-left" href="#">
        <img ng-src="{{room.url}}">
            <h2>房型：{{room.name}}</h2>
            <p>价格：{{room.price}}</p>
            <p>描述：{{room.description}}</p>
            <p>入住时间：{{beginTime}}至{{endTime}}</p>
      </a>
      <label class="item item-input">
        <span class="input-label">房间数：</span>
        <select ng-model='repeatSelect'>
          <option ng-repeat='count in counts' value='{{count.value}}' selected>{{count.value}}</option>
        </select>
        {{repeatSelect}}
      </label>
      <label class="item item-input">
      <span class="input-label">到店时间：</span>
        <input class='col-75' type="text" name="arriveTime" ng-model="arriveTime" required />
          <p class='col-25' ng-show="myForm.arriveTime.$dirty && myForm.arriveTime.$invalid"><span class='dollar' ng-show="myForm.arriveTime.$error.required">时间必填</span></p>
      </label>
      <label class="item item-input">
      <span class="input-label">入住人：</span>
        <input class='col-75' type="text" name="name" ng-model="name" required />
          <p class='col-25' ng-show="myForm.name.$dirty && myForm.name.$invalid"><span class='dollar' ng-show="myForm.name.$error.required">姓名必填</span></p>
      </label>
      <label class="item item-input">
      <span class="input-label">手机号：</span>
        <input class='col-75' type="text" name="phone" ng-model="phone" required />
          <p class='col-25' ng-show="myForm.phone.$dirty && myForm.phone.$invalid"><span class='dollar' ng-show="myForm.phone.$error.required">手机号必填</span></p>
      </label>
      <div class="item">
        <span class="danger">温馨提示：{{prompt}}</span>
      </div>
      <label class="item item-input">
        <span class="input-label">完成支付并评价您将获得{{credit}}积分</span>
      </label>
    </div>
    <div class="bar bar-footer">
        <div class="col col-75">
          <h4 class="dollar pull-right">在线支付:￥{{totalPay}}</h4>
        </div>
        <div class="col col-25">
          <button ng-disabled='myForm.$invalid' ng-click='submitOrder()' class="button button-block button-positive">提交订单</button>
        </div>
    </div>
    </form>
  </ion-content>
</ion-view>
<script>
