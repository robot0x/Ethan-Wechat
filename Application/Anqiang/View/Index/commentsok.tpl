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


  <div class="ziti">
  <p class="da">点评成功！！</p>
  <p class="zhong">获得积分&nbsp+5</p>
  <p class="xiao"><a>我的积分>></a></p>
  </div>







</body>
</html>

<style type="text/css">
  .ziti{
    text-align: center; 
    margin-top: 90px;
  }
  p{
    font-family: "宋体";
    font-style: oblique;
    color: blue;
  }
  .da
  {
    font-size: 37px;
  }
  .zhong
  {
    font-size: 28px;
    padding-top: 10px;  
  }
  .xiao
  {
    font-size: 20px;
    padding-top: 15px;
    cursor: pointer;
    text-decoration: underline;
    color: blue;
    padding: 3px auto 3px auto;
  }

</style>