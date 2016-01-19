<script id="templates/indexDate.html" type="text/ng-template">
<ion-view view-title="选择日期" ng-controller='DateCtrl'>
<ion-content>
<ionic-datepicker input-obj="datepickerObject">
  <button class="button button-block button-positive" ng-model='minDay' ng-controller='BeginCtrl'>开始日期 {{minDay | date:datepickerObject.dateFormat}}</button>
  <button class="button button-block button-positive"  ng-controller='FinishCtrl' ng-model='maxDay'>结束日期 {{maxDay | date:datepickerObject.dateFormat}}</button>
</ionic-datepicker>
  
</ion-content>
</ion-view>
</script>