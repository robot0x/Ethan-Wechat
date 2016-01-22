app.controller('MapCtrl', function() {
 // 百度地图API功能
 
  wx.ready(function () {
    wx.getLocation({
      type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
      success: function (res) {
          var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
          var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
          var speed = res.speed; // 速度，以米/每秒计
          var accuracy = res.accuracy; // 位置精度

          console.log(latitude);
          console.log(longitude);
          var map = new BMap.Map("allmap");
          var start = new BMap.Point(longitude, latitude);
          var end = "洛克高级酒店公寓";
          map.centerAndZoom(new BMap.Point(longitude, latitude), 11);
          map.setCurrentCity("天津");          // 设置地图显示的城市 此项是必须设置的
          map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

      // //三种驾车策略：最少时间，最短距离，避开高速
          var route = 0;
          var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, panel: "result", autoViewport: true},policy: route});
          driving.search(start,end);
      },
    });
  });
  
});