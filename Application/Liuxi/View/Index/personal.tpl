<!DOCTYPE html>
<html ng-app="yunzhiclub">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
  <title></title>

  <link href="__LIB__/ionic/css/ionic.css" rel="stylesheet">
  <link href="__CSS__/style.css" rel="stylesheet">

    <!-- IF using Sass (run gulp sass first), then uncomment below and remove the CSS includes above
    <link href="css/ionic.app.css" rel="stylesheet">
  -->


  <!-- ionic/angularjs js -->
  <script src="__LIB__/ionic/js/ionic.bundle.js"></script>

  <!-- your app's js -->
  <script src="__JS__/app.js"></script>

</head>
<body ng-controller="MyCtrl">
	<div class="bar bar-header bar-light">
		<h1 class="title">我的京东</h1>
	</div>

	<div class="scroll-content has-header ionic-pseudo">

		<div class="list">
			<a class="item item-avatar" href="#">
				<img src="img/rujia.jpg">
				<h2>anqiang</h2>
				<p>registrated</p>
			</a>
			<div class="button-bar bar-light ">
				<a class="button button-small">0<h6>关注的商品</h6></a>
				<a class="button button-small">0<h6>关注的商品</h6></a>
				<a class="button button-small">0<h6>关注的商品</h6></a>
			</div>
		</div>
		<div class="list">


			<a class=" item item-icon-left item-icon-right" href="#">
				<i class="icon ion-clipboard"></i>
				<h5>我的订单</h5>
				<span class="item-note">

				</span>
				<i class="icon ion-ios-arrow-right"></i>
			</a>
			<div class="  button-bar bar-light">
				<a class="button button-small"><i class="ion-ios-arrow-right"></i><h6>待付款</h6></a>
				<a class="button button-small"><i class="ion-ios-arrow-right"></i><h6>待收货</h6></a>
				<a class="button button-small"><i class="ion-ios-arrow-right"></i><h6>待评价</h6></a>
				<a class="button button-small"><i class="ion-ios-arrow-right"></i><h6>退货</h6></a>
			</div>
		</div>
		<div class="list">
			<a class=" item item-icon-left item-icon-right" href="#">
				<i class="icon ion-ios-locked"></i>
				<h5>我的钱包</h5>
				<span class="item-note">

				</span>
				<i class="icon ion-ios-arrow-right"></i>
			</a>

			<div class="button-bar bar-light">
				<a class="button button-small"><i class="ion-ios-arrow-right"></i><h6>账户余额</h6></a>
				<a class="button button-small"><i class="ion-ios-arrow-right"></i><h6>优惠券</h6></a>
				<a class="button button-small"><i class="ion-ios-arrow-right"></i><h6>京豆</h6></a>
				<a class="button button-small"><i class="ion-ios-arrow-right"></i><h6>京东卡/E卡</h6></a>
			</div>
		</div>

		<div class="list">
			<a class=" item item-icon-left item-icon-right" href="#">
				<i class="icon ion-ios-telephone"></i>
				<h5>服务与反馈</h5>
				<span class="item-note">
					
				</span>
				<i class="icon ion-ios-arrow-right"></i>
			</a>
			<a class=" item item-icon-left item-icon-right" href="#">
				<i class="icon ion-ios-person"></i>
				<h5>京东会员</h5>
				<span class="item-note">
					
				</span>
				<i class="icon ion-ios-arrow-right"></i>
			</a>
		</div>



		<div class="list row">

			<a class="item item-thumbnail-left" href="#">
				<img src="img/rujia.jpg">
				<h2>Pretty Hate Machine</h2>
				<p>Nine Inch Nails</p>
			</a>
			<a class="item item-thumbnail-left" href="#">
				<img src="img/rujia.jpg">
				<h2>Pretty Hate Machine</h2>
				<p>Nine Inch Nails</p>
			</a>
			<a class="item item-thumbnail-left" href="#">
				<img src="img/rujia.jpg">
				<h2>Pretty Hate Machine</h2>
				<p>Nine Inch Nails</p>
			</a>
		</div>



		<div class="tabs tabs-icon-only">
			<a class="tab-item">
				<i class="icon ion-home"></i>
			</a>
			<a class="tab-item">
				<i class="icon ion-search"></i>
			</a>
			<a class="tab-item">
				<i class="icon ion-ios-cart"></i>
			</a>

			<a class="tab-item">
				<i class="icon ion-navicon"></i>
			</a>

			<a class="tab-item">
				<i class="icon ion-person"></i>
			</a>
		</div>
	</div>


	</body>
	</html>