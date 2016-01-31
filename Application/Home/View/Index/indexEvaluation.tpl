<script id="templates/indexEvaluation.html" type="text/ng-template">
  <ion-view view-title="查看评论" ng-controller='EvaluationCtrl'>
  <ion-content>
    <div class="list">
    {/*<div ng-bind="evaluations | json"></div>*/}
      <div class="item item-avatar" href="#" ng-repeat='evaluation in evaluations'>
        <img ng-src="{{evaluation.customer__headimgurl}}" >
          <div class="row">
            <div class="col col-40">      
              <h2>{{evaluation.customer__nickname}}</h2>
            </div>
            <div class="col">
            <i class="icon {{evaluation.icon[0]}}" style="color:#FFFF00;"></i>
            <i class="icon {{evaluation.icon[1]}}" style="color:#FFFF00;"></i>
            <i class="icon {{evaluation.icon[2]}}" style="color:#FFFF00;"></i>
            <i class="icon {{evaluation.icon[3]}}" style="color:#FFFF00;"></i>
            <i class="icon {{evaluation.icon[4]}}" style="color:#FFFF00;"></i>
            </div>
          </div>
          <p>{{evaluation.evaluation}}</p>
          <div class="row" ng-repeat='url in evaluation.url'>
          <div class="list">
            <div class="item-thumbnail-left">
              <img ng-src="{{url}}">
            </div>
          </div>
          </div>
      </div>
    </div>
    <ion-infinite-scroll ng-if="moreDataCanBeLoaded" on-infinite="loadMoreData()">
</ion-infinite-scroll>
    
 

</ion-content>
</ion-view>
</script>