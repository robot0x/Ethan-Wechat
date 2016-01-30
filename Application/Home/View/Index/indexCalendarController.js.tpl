app.controller('DateCtrl',function($scope ,$http,$location , Calendar, Home, RoomFactory){
	//初始化
	$scope.calendar		= {:$M::getCalendarAjax()};	//由M层中取得初始值
	$scope.showLeft 	= 0;						//是否显示左侧菜单
	$scope.showRight 	= 1;						//是否显示右侧菜单
	$scope.total 		= 0;						//初始化，共几晚
	var beginIndex 		= -1;						//开始日期
	var endIndex		= -1;						//结束日期
	var beginTime       = Calendar.beginDate;       //用于get传值
	var end_time        = Calendar.endDate;         //用于get传值
	var total           = Calendar.total;
	//记录当前月份
	var index = 0;
	var monthLength = $scope.calendar.data.length;

	//将第0个元素给当前日历
	$scope.currentCalendar = $scope.calendar.data[index];

	//判断当前的日历是否为最后一月
	if ($scope.currentCalendar.isLastMonth)
	{
		$scope.showRight 	= 0;
	}

	//日期选择
	$scope.chooseDay = function(currentday)
	{	

		//判断点击是否有效
		if (currentday.isDisabled == true)
		{
			return;
		}

		//判断点击是开始时间还是结束时间
		if (checkBeginOrEndDate(currentday.index))
		{
			beginIndex = currentday.index;
			endIndex = -1;

			//用户点的为开始时间,除点亮本身外，其它全部熄灭
			//选遍历月，再遍历周，再遍历天
			$scope.calendar.data.forEach(function(month, monthIndex){
				month.weeks.forEach(function(week, weekIndex){
					week.forEach(function(day, dayIndex){
						if (currentday == day)
						{
							day.class = "positive";
						}
						else if(day.isDisabled != true)
						{
							day.class = "";
						}
					})
				});
			});

			//给factory传值
			Calendar.beginDate = Calendar.endDate = currentday.date;
			Calendar.total = 1;
			//console.log(Calendar);
			//设置总天数
			$scope.total = 1;
		}
		else
		{
			//如果先点的结束日期，后点的开始日期，则进行两个日期的互换操作
			//同时，将值传给factory
			if (currentday.index >= beginIndex)
			{
				endIndex 			= currentday.index;

				//给factory传值
				Calendar.endDate 	= currentday.date;
			}
			else
			{
				endIndex = beginIndex;
				beginIndex = currentday.index;

				//给factory传值
				Calendar.endDate 	= Calendar.beginDate;
				Calendar.beginDate 	= currentday.date;
			}

			Calendar.total = (endIndex - beginIndex) ? endIndex - beginIndex : 1;
			beginTime = Calendar.beginDate;
			endTime = Calendar.endDate;
			//用户点结结束时间，则判断数是否位于两者之间。点亮区间的数据。熄灭其它的
			//选遍历月，再遍历周，再遍历天
			$scope.calendar.data.forEach(function(month, monthIndex){
				month.weeks.forEach(function(week, weekIndex){
					week.forEach(function(day, dayIndex){
						if ((day.index >= beginIndex) && (day.index <= endIndex))
						{
							day.class = "positive";
						}
						else if(day.isDisabled != true)
						{
							day.class = "";
						}
					})
				});
			})

			$scope.total = endIndex - beginIndex;			
		}		
	};

	$scope.nextMonth = function(){
		if ($scope.currentCalendar.isLastMonth === true)
		{
			return;
		}
		else
		{
			index++;
			$scope.currentCalendar = $scope.calendar.data[index];
		}
	};

	$scope.preMonth = function(){
		if ($scope.currentCalendar.isFirstMonth === true)
		{
			return;
		}
		else
		{
			index--;
			$scope.currentCalendar = $scope.calendar.data[index];
		}
	};
	//判断用户点击的是否开始时间
	//是，返回ture.否，false
	var checkBeginOrEndDate = function(index){
		
		//如果有开始时间，没有结束时间，则用户点击的为结束时间
		//否则，用户点击的为开始时间
		if (beginIndex != -1 && endIndex == -1)
		{
			return false;
		}
		else
		{
			return true;
		}
	};

	$scope.upDateCalendar = function() {
		RoomFactory.fn.getRooms(function(){
			return true;
		});
	}
 });