app.factory('ActivityFactory', function(){
	var activities = {:$M->getActivityLists()};
	return {
		"activities" : activities,
	};
})