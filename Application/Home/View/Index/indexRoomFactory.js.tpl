app.factory('RoomFactory' ,function($http, Calendar){
    var rooms = {:$M->getRooms()};
    var jsonVal = {roomId:''};
    var fn = {};
    fn.getRooms = function(callback){
        var params = {"begin_time":Calendar.beginDate, "end_time":Calendar.endDate};
        $http.get("__ROOT__/api.php/Room/getRooms",{params:params})
        .success(function(data){
            console.log("getRooms");
            rooms = data.data;
            callback();
        })
        .error(function(){

        });
    };

    return{
        "rooms": rooms,
        getVal : function() {return jsonVal;},
        setVal : function(json) {jsonVal.roomId = json;},
        fn:fn,
    };
});