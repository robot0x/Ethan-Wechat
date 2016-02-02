<script id="templates/indexActivity.html" type="text/ng-template">
<ion-view view-title="洛克高级酒店公寓" ng-controller='ActivityCtrl'>
<ion-content>
	<div class="list">
  <div class="item item-avatar" ng-repeat='activity in activities'>
    <img ng-src="{{activity.thumbnails_url}}">
    <a href="#/activityDetail/{{activity.id}}">
    <h2>{{activity.title}}</h2>
    <p>截止到{{activity.end_time | date:'yyyy-MM-dd'}}</p></a>
  </div>
	</div>
  </ion-content>
	</ion-view>
</script>