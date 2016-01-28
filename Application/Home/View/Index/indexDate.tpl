<script id="templates/indexDate.html" type="text/ng-template">
<ion-view view-title="选择日期" ng-controller='DateCtrl'>
	<div class="bar bar-subheader bar-stable">
  <span ng-show="!currentCalendar.isFirstMonth" ng-click="preMonth()" class="button button-icon ion-back"></span>
  <h6 class="title">{{currentCalendar.year}}年{{currentCalendar.month}}月</h6>
  <span ng-show="!currentCalendar.isLastMonth" ng-click="nextMonth()" class="button button-icon ion-right"></span>
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
		<div class="item row">
			<div class="col">共{{total}}晚</div>
		</div>
	</div>
		<div class="padding">
        <a ui-sref="tabs.home" ng-click="upDateCalendar()"><button class="button button-block button-positive">确定</button></a>
      </div>
</ion-view>
</script>