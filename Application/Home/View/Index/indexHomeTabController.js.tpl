app.controller('HomeTabCtrl', function($ionicLoading, $scope,$timeout,Calendar,RoomFactory,TimeRoom,HomeFactory,BaseService,IntroductionFactory) {
  $scope.beginDate    = Calendar.beginDate;
  $scope.endDate      = Calendar.endDate;
  $scope.total        = Calendar.total;
  $scope.slideUrls    = HomeFactory.slideUrls;
  $scope.slideMapUrl  = HomeFactory.slideMapUrl;
  $scope.fenToYuan    = BaseService.fenToYuan;
  $scope.timeRoom     = TimeRoom.timeRoom.value;
  $scope.hotelPhone   = IntroductionFactory.introduction.hotel_phone;
  var rooms = RoomFactory.rooms;
  for (var k in rooms) {
    rooms[k]['detail'] = false;
    rooms[k]['order'] = '#/confirmOrder/'+ rooms[k].id;
  }
  $scope.rooms = rooms;
  $scope.toggleDetail = function(room){
    room.detail = !room.detail;
    var order = room.order;
    room.order = '';
    $timeout(function(){
     room.order = order;
    },100);
  };
  // console.log(rooms);
});
