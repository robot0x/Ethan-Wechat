app.controller("HomeTabCtrl", function($scope, RoomFactory){
    $scope.rooms = RoomFactory.Rooms;
});