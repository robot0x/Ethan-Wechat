<script id="templates/indexEvaluationing.html" type="text/ng-template">
<style>
.rating {
  color: #a9a9a9;
  margin: 0;
  padding: 0;
}
ul.rating {
  display: inline-block;
}
.rating li {
  list-style-type: none;
  display: inline-block;
  padding: 1px;
  text-align: center;
  font-weight: bold;
  cursor: pointer;
}
.rating .filled {
  color: #ffee33;
}
</style>
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
					<div star ng-click='getStarLeave()' rating-value="ratingVal" max="max" on-hover="onHover" on-leave="onLeave" readonly="{{readonly}}"></div>
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