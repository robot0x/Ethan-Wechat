<script id="templates/indexEvaluation.html" type="text/ng-template">
  <ion-view view-title="查看评论">
 
  <ion-content>
      <div class="padding">
        <a class="button button-block button-positive" href="#/tab/evaluationing">我要评论</a>
     </div>
    <div class="list">
      <div class="item item-avatar" href="#">
        <img src="__IMG__/tupian.png" >
          <div class="row">
            <div class="col col-33">      
              <h2>Venkman</h2>
            </div>
            <div class="col">
            <i class="icon {{evaluation.icon[0]}}" style="color:#FFFF00;"></i>
            <i class="icon {{evaluation.icon[1]}}" style="color:#FFFF00;"></i>
            <i class="icon {{evaluation.icon[2]}}" style="color:#FFFF00;"></i>
            <i class="icon {{evaluation.icon[3]}}" style="color:#FFFF00;"></i>
            <i class="icon {{evaluation.icon[4]}}" style="color:#FFFF00;"></i>
            </div>
          </div>

          <div class="list">
            <div class="item-thumbnail-left">
              <img src="__IMG__/rujia.jpg">
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