<script id="templates/indexActivity.html" type="text/ng-template">
<ion-view view-title="最新活动" ng-controller='ActivityCtrl'>
<ion-content>
	<div class="list">
  <div class="item item-avatar" ng-repeat='activity in activitys'>
    <img ng-src="{{activity.thumbnails_url}}">
    <a href="#/tab/activityDetail">
    <h2>{{activity.title}}</h2>
    <p>截止到{{activity.end_time}}</p></a>
  </div>
	</div>
  </ion-content>
	</ion-view>
</script>