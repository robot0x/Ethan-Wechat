app.factory('TimeRoom', function(){
	var timeRoom = {:json_encode($M->timeRoom)};
	return {
		"timeRoom" : timeRoom,
	};
})