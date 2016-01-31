<script id="templates/indexEvaluationing.html" type="text/ng-template">
<ion-view view-title='洛克高级酒店公寓'>
    <div class="bar bar-header">
        <a ng-href='#/tab/personal'><button class="button button-icon icon ion-ios-arrow-back"></button></a>
        <div class="h1 title">评价赢积分</div>
    </div>
        <ion-content class='has-header' ng-controller='EvaluationingCtrl'>
            <div class="item item-thumbnail-left">
                <img ng-src="{{room.url}}">
                <h2><i class="icon ion-social-yen"></i>{{room.name}}</h2>
                <p>{{room.description}}</p>
            </div>
            <div class="list">
                <div class="item item-body">
                    <div class="row row-center">
                        <div class="col col-20">
                            <span>评分</span>
                        </div>
                        <div class="col">
                            <div star ng-click='getStarLeave()' rating-value="ratingVal" max="max" on-hover="onHover" on-leave="onLeave" readonly="{{readonly}}"></div>
                        </div>
                    </div>
                    <div class="item item-input item-floating-label">
                        <textarea ng-model="evaluation" type="text" placeholder="请输入您的评论" cols="60" rows="4"></textarea>
                    </div>
                    <div class="row">
                        <div class="col col-33-center">
                            <button ng-show="showUpload" ng-click='upload()' class="button button-small button-outline ">
                                <i class="icon ion-image"></i> 上传图片
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" ng-repeat="value in localIds track by $index">
	                        <div class="item item-thumbnail-left" >
	                            <img ng-src="{{value}}" />
	                        </div>
                        </div>
                    </div>
                </div>
                <a ng-click="submit($event)">
                    <div class="padding">
                        <button class="button button-full button-positive">
                            提交评论
                        </button>
                    </div>
                </a>
                <div>
                </div>
        </ion-content>
    </ion-view>
</script>
