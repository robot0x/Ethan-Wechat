app.controller('ConfirmOrderCtrl',function($scope,$http,$stateParams,RoomFactory,Calendar,OrderFactory,$ionicPopup,$location){
  var roomId = $stateParams.roomId;
  $scope.rooms = RoomFactory.rooms.toObjectByKey();
  var room = {};
  $scope.room = room = $scope.rooms[roomId];
  var price = $scope.room.price;
  $scope.room.price = parseInt($scope.room.price).fenToYuan();
  
   $scope.notice = OrderFactory.orderInfo.notice;                     //住店须知
   $scope.prompt = OrderFactory.orderInfo.prompt;                     //温馨提示
   $scope.arriveTime = "14:00-次日04：00";                             //到店时间
   var name = $scope.name = OrderFactory.orderInfo.customerName;      //入住人姓名
   var phone = $scope.phone = OrderFactory.orderInfo.customerPhone;   //入住人姓名
   $scope.beginTime = Calendar.beginDate;                             //住店日期
   $scope.endTime = Calendar.endDate;                                 //离店日期
   var repeatSelect = $scope.repeatSelect = 1;
   $scope.counts = $scope.room.remaining_count.getArray();
   $scope.totalPay = (price * $scope.repeatSelect * Calendar.total).fenToYuan();
   //将房间数量改变时
    $scope.changValue = function(value){
      $scope.totalPay = (parseInt(price)*parseInt(value)*Calendar.total).fenToYuan();
      $scope.credit = parseInt($scope.totalPay)/parseInt(OrderFactory.orderInfo.credit);
      repeatSelect = value;
   };
   console.log(OrderFactory);
   $scope.changeName = function(value){
      name = value;
   }
  
  $scope.changePhone = function(value)
  {
      phone = value;
  }

   $scope.submitOrder = function() {
    var params = {room_id:roomId,
                  begin_time:Calendar.beginDate,
                  end_time:Calendar.endDate,
                  totalDay:Calendar.total,
                  customer_name:name,
                  customer_phone:phone,
                  count:repeatSelect};
     $http.get('api.php/Api/Order/addList',{params:params})
      .success(function(data,status){
         if (data.status ==='success') {
            console.log(params);
            console.log(data);
           $location.path('/pay/'+data.order_id);
         }
         else{
          console.log(data.message);
           $ionicPopup.alert({
                title: '系统错误',
                template: '系统错误，请稍后重试.',
            });
         }
       })
      .error(function(data,status){
         alert('没有找到该方法');
      });
   }
 });