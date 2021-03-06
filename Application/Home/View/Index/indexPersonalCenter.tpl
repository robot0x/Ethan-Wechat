<script id="templates/indexPersonalCenter.html" type="text/ng-template">
	<ion-view view-title="洛克高级酒店公寓" ng-controller="personalCenter">
	<ion-content>
	<div class="list">
		<a class="item item-avatar" href="#">
			<img ng-src="{{headimgurl}}">
			<h3>{{nickname}}</h3>
			<p>{{phone}}</p>
			<p>{{credit}}</p>
		</a>

		<div class="button-bar">
			<a ui-sref="tabs.allOrder({type:'toBePaid'})" class="button button-light">
				<i class="icon ion-daizhifu"></i>
				<p>待支付</p>
			</a>
			<a ui-sref="tabs.allOrder({type:'toBeEvaluation'})" class="button button-light">
				<i class="icon ion-daipingjia2"></i>
				<p>待评价</p>
			</a>
			<a ui-sref="tabs.allOrder({type:'toBeStay'})" class="button button-light">
				<i class="icon ion-ruzhu"></i>
				<p>待入住</p>
			</a>
	</div>

	<a ui-sref="tabs.allOrder({type:'all'})" class="item item-icon-left item-icon-right">
		<i class="icon ion-quanbudingdan"></i>
		全部订单
		<i class="icon ion-iconfontunie61f"></i>
	</a>
	<a href="tel:{{hotelPhone}}" class="item item-icon-left">
		<i class="icon ion-kefu"></i>
		客服  {{hotelPhone}}
	</a>
</div>
</ion-content>
</ion-view>
</script>
