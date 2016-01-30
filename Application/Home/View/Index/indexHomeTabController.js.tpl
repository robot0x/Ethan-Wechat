app.controller('HomeTabCtrl', function($scope,$timeout,Home,Calendar,RoomFactory,HomeFactory) {
  $scope.beginDate    = Calendar.beginDate;
  $scope.endDate      = Calendar.endDate;
  $scope.rooms        = RoomFactory.rooms;
  console.log($scope.rooms);
  $scope.total        = Calendar.total;
  $scope.slideUrls    = HomeFactory.slideUrls;
  $scope.slideMapUrl  = HomeFactory.slideMapUrl;
  
  $scope.toggleDetail = function(room){
    room.detail = !room.detail;
    var order = room.order;
    room.order = '';
    $timeout(function(){
     room.order = order;
    },100);
  }
});
