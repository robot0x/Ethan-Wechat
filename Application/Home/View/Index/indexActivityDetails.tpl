<script id="templates/indexActivityDetails.html" type="text/ng-template">
	<ion-view view-title="洛克高级酒店公寓" ng-controller='ActivityDetailCtrl'>
	<div class="bar bar-header">
  <a ng-href='#/tab/activity'><button class="button button-icon icon ion-ios-arrow-back"></button></a>
  <div class="h1 title">活动详情</div>
</div>
	<ion-content class='has-header'>
			<div ng-bind-html="activity.detail | trustHtml" class="list">
				
			</div>
</ion-content>
</ion-view>
</script>