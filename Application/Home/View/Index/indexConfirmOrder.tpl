<script id="templates/indexConfirmOrder.html" type="text/ng-template">
<ion-view view-title="订单填写">
	<ion-content class="ion-content">
		<div class="">
      <h4 class="tittle">预付须知：</h4>
    </div>
    <div class="list">
      <a class="item item-thumbnail-left" href="#">
        <img src="__IMG__/big.jpg">
            <h2>房型：大床房</h2>
            <p>价格：365.00</p>
            <p>介绍：空调/电视/wifi</p>
            <p>入住时间：2015.11.25</p>
      </a>
      <label class="item item-input">
        <span class="input-label">房间数：</span>
        <select>
          <option selected>1</option>
          <option selected>2</option>
          <option selected>3</option>
          <option selected>4</option>
          <option selected>5</option>
        </select>
      </label>
      <label class="item item-input">
        <span class="input-label">到店时间：</span>
        <select>
          <option selected>14:00-次日04：00</option>
        </select>
      </label>
      <label class="item item-input">
        <span class="input-label">入住人：</span>
        <input type="text" />
      </label>
      <label class="item item-input">
        <span class="input-label">手机号：</span>
        <input type="text" />
      </label>
      <div class="item">
        <span class="danger">温馨提示：注意到店时间为14:00-04:00</span>
      </div>

      <div class="item item-checkbox">
         <label class="checkbox">
           <input type="checkbox" checked="">
         </label>
         用200积分换打折卡
      </div>
      <label class="item item-input">
        <span class="input-label">积分兑换：</span>
        <select>
          <option selected>用200积分换打折卡</option>
        </select>
      </label>
    </div>
55xz
    <div class="bar bar-footer">
      <div class="row">
        <div class="col-75">
          <h4 class="dollar pull-right">在线支付：￥365.00</h4>
        </div>
        <div class="col-25 col-demo">
          <a href="#/tab/paySuccess1">
            <div class="button button-large button-positive">
              提交订单
            </div>
          </a>
        </div>
      </div>
    </div>
	</ion-content>
</ion-view>
<script>
