app.controller('HomeTabCtrl', function($scope,$timeout,Home,Calendar,RoomFactory) {
  $scope.beginDate = Calendar.beginDate;
  $scope.endDate = Calendar.endDate;
  console.log($scope.beginDate);
  console.log($scope.endDate);
  $scope.total = Calendar.total;
  Home.getJosn().success(function(data) {
    if(data.slideUrls.status==='success'){
        $scope.slideUrls = data.slideUrls.data;
      }else{
        alert("幻灯片数据错误");
      }
      if(data.slideMapUrl.status==='success'){
        $scope.slideMapUrl = data.slideMapUrl.data;
      }else{
        alert("地图数据错误");
      }
      if(data.rooms.status==='success'){
        $scope.rooms = data.rooms.data;
      }else{
        alert("房间数据错误");
      }
  });
  $scope.toggleDetail = function(room){
    room.detail = !room.detail;
    var order = room.order;
    room.order = '';
    $timeout(function(){
     room.order = order;
    },100);
  }
});
