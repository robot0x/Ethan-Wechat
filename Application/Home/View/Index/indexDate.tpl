<script id="templates/indexDate.html" type="text/ng-template">
<ion-view view-title="选择日期" ng-controller='DateCtrl'>
<ion-content>
<ionic-datepicker input-obj="datepickerObject">
  <button class="button button-block button-positive">开始日期 {{datepickerObject.inputDate | date:datepickerObject.dateFormat}}</button>
  <button class="button button-block button-positive">结束日期 {{datepickerObject.inputDate | date:datepickerObject.dateFormat}}</button>
</ionic-datepicker>
  
</ion-content>
</ion-view>
</script>