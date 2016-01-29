<script id="templates/indexActivityDetails.html" type="text/ng-template">
	<ion-view view-title="住店送牛奶" ng-controller='ActivityDetailCtrl'>
	<ion-content>
			<div ng-bind-html="activity.detail | trustHtml" class="list">
				
			</div>
</ion-content>
</ion-view>
</script>