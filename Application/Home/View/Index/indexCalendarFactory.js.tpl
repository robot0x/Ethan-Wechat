app.factory('Calendar' ,function(){
	return {
		beginDate : "{:date("Y-m-d")}",
		endDate: "{:date("Y-m-d",time()+24*60*60)}",
		total: 1,
	};
});