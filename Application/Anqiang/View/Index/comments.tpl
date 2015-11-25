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


	
	<style>

	.h1
	{
		padding-top: -20px;
		margin-top: -20px;
	}
	.pingfen
	{
		height: 50px;
		line-height: 50px;
	}
	.area
	{
		margin-top: 10px;
		margin-bottom: 20px;
	}
	.submit
	{
		margin-top: 90px;
	}
	.zi
	{
		font-size: 15px;
			
	}

	.he
	{
		margin-top: 30px;
		margin-left: 10px;
		margin-right: 10px;
		padding-left: 5px;
		padding-right: 5px;
		padding-top: 10px;

	}
	.he .button
	{
		min-height: 31px;
		line-height: 50px;
	}
	.pic
	{
		margin-top: -13px;
	}
	.item-input
	{
		padding: 3px 2px 3px 2px;
	}
	textaera
	{
		width:128%;
	}

</style>
</head>
<body ng-controller="MyCtrl">
<div class="bar bar-header bar-positive">
	<a class="button icon button-icon ion-chevron-left"></a>
	<h1 class="title">我要评价</h1>
</div>
<div class="scroll-content has-header">
	<div class="item item-thumbnail-left item-light">
		<img src="__IMG__/rujia.jpg">
		<h2><i class="icon ion-social-yen"></i>120</h2>
		<p>介绍</p>
	</div>
	<div class="hi">
		<div class="item item-body">
			<div class="pingfen">
				<span class="zi" style="line-height:30px; vertical-align:25%">评分</span>	
				<img src="__IMG__/star.png">
			</div>
			<label class="item item-input item-floating-label area">
				
				<textarea type="text" placeholder="请输入您的评论" cols="60" rows="4" style="padding-right:10px;padding-left:-30px;"></textarea>
			</label>
			<button class="button button-small button-outline pic">
				<i class="icon ion-image"></i>
				上传图片
			</button>
		</div>
	</div>
<!-- 	<div class="bar bar-footer" style="padding:3px 0px 10px 0px;">
		<button class="button button-block button-positive " style="padding:0px 0px 10px 0px;">
			提交评论<i class="icon ion-checkmark"></i>
		</button>
	</div> -->
	
 
 

<div class="he">
	<button class="button button-full button-positive">
				提交评论
	</button>
	</div>
	

	
	<div>
	
</body>
</html>
