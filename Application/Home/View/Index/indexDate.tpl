<script id="templates/indexDate.html" type="text/ng-template">
<ion-view view-title="选择日期" ng-controller='DateCtrl'>
	<div class="bar bar-subheader bar-stable">
  <span ng-show="showLeft" class="button button-icon ion-back"></span>
  <h6 class="title">{{calendar.year}}年{{calendar.month}}月</h6>
  <span ng-show="showRight" class="button button-icon ion-right"></span>
  </div>
<ion-content>

	<div class="list has-header text-center">
		<div class="item row">
			<div class="col">日</div>
			<div class="col">一</div>
			<div class="col">二</div>
			<div class="col">三</div>
			<div class="col">四</div>
			<div class="col">五</div>
			<div class="col">六</div>
		</div>
		<div class="item row" ng-repeat="weeks in currentCalendar.weeks">
			<div class="col {{day.class}}" ng-repeat="day in weeks" ng-click="chooseDay(day)">
				{{day.day}}
			</div>
		</div>
	</div>
</ion-view>
</script>