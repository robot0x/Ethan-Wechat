app.factory('RoomFactory' ,function(){
    var rooms = {:$M->getRooms()};
    return{
        "rooms": rooms,
    };
});