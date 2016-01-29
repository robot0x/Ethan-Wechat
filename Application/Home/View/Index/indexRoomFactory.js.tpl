app.factory('RoomFactory' ,function(){
    var rooms = {:$M->getRooms()};
    var jsonVal = {roomId:''};
    return{
        "rooms": rooms,
        getVal : function() {return jsonVal;},
        setVal : function(json) {jsonVal.roomId = json;}
    };
});