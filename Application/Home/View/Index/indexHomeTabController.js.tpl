app.controller("HomeTabCtrl", ['$scope', RoomFactory, function(){
    $scope.rooms = RoomFactory.Rooms;
}]);