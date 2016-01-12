<script id="templates/indexEvaluationing.html" type="text/ng-template">
	<ion-view view-title="评论">
	<ion-content ng-controller='EvaluationingCtrl'>
	<div class="item item-thumbnail-left">
		<img src="__IMG__/rujia.jpg">
		<h2><i class="icon ion-social-yen"></i>120</h2>
		<p>介绍</p>
	</div>
	<div class="list">
		<div class="item item-body">
			<div class="row row-center">
				<div class="col col-20">
					<span>评分</span>
				</div>

				<div class="col">
					<uib-rating ng-model="rate" max="max" readonly="isReadonly" on-hover="hoveringOver(value)" on-leave="overStar = null" titles="['one','two','three']" aria-labelledby="default-rating"></uib-rating>
					<span class="label" ng-class="{'label-warning': percent<30, 'label-info': percent>=30 && percent<70, 'label-success': percent>=70}" ng-show="overStar && !isReadonly">{{percent}}%</span>
				</div>
			</div>

			<div class="item item-input item-floating-label">
				<textarea type="text" placeholder="请输入您的评论" cols="60" rows="4" ></textarea>
			</div>


			<div class="row">
				<div class="col col-33-center">
					<button ng-click='upload()' class="button button-small button-outline ">
						<i class="icon ion-image"></i>
						上传图片
					</button>
				</div>
				<div class="col col-33">
					<div class="list">
						<div class="item-avatar">
							<img src="__IMG__/rujia.jpg">
						</div>
					</div>
				</div>
			</div>

		</div>

		<a href="#/tab/success">
			<div class="padding">
				<button class="button button-full button-positive">
					提交评论
				</button>
			</div></a>
			<div>
			</div>
		</ion-content>
	</ion-view>
</script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>