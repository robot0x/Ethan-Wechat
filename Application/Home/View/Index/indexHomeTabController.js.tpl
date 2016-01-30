app.controller('HomeTabCtrl', function($ionicLoading, $scope,$timeout,Home,Calendar,RoomFactory,HomeFactory,BaseService) {
  $scope.beginDate    = Calendar.beginDate;
  $scope.endDate      = Calendar.endDate;
  $scope.rooms        = RoomFactory.rooms;
  $scope.total        = Calendar.total;
  $scope.slideUrls    = HomeFactory.slideUrls;
  $scope.slideMapUrl  = HomeFactory.slideMapUrl;
  $scope.fenToYuan    = BaseService.fenToYuan;
  $scope.toggleDetail = function(room){
    room.detail = !room.detail;
    var order = room.order;
    room.order = '';
    $timeout(function(){
     room.order = order;
    },100);
  };
});
