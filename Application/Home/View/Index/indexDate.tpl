<script id="templates/indexDate.html" type="text/ng-template">
<ion-view view-title="选择日期" ng-controller='DateCtrl'>
<ion-content>
<div class="u-cover">
    <div class="u-dtp">
        <div class="u-dtp-header">
            <label>日期:
                <input class="ipt-date" type="text" ng-model="source.crtDate"/>
            </label>
        </div>
        <div class="u-dtp-content" id="{{id}}">
            <div class="month" ng-repeat="month in source.result track by $index">
                <div class="title">
                    <span>{{month.date| date: 'yyyy年MM月'}}</span>
                </div>
                <div class="dtp-week">
                    <span class="week">日</span>
                    <span class="week">一</span>
                    <span class="week">二</span>
                    <span class="week">三</span>
                    <span class="week">四</span>
                    <span class="week">五</span>
                    <span class="week">六</span>
                </div>
                <div class="dtp-day">
            <span class="day"
                  ng-repeat="day in month.days "
                  ng-style="{
                    'visibility': day.getMonth() === month.date.getMonth() ? 'visible' : 'hidden',
                    }"
                  ng-class="{
                  'today': source.today.getTime() === day.getTime(),
                  'z-crt': day.getTime() === crtTimestamp
                  }"
                  ng-click="setDate(day)"
                    >
                {{ day | date: 'dd' }}
            </span>
                </div>
            </div>
        </div>
        <div class="u-dtp-btns">
            <button class="ok">确定</button>
            <button class="cancel">取消</button>
        </div>
    </div>
</div>
</ion-content>
</ion-view>
</script>