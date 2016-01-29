app.controller('ConfirmOrderCtrl',function($scope,$http,$stateParams,RoomFactory,Calendar,OrderFactory){
  var roomId = $stateParams.roomId;
  console.log(roomId);
  $scope.rooms = RoomFactory.rooms.toObjectByKey();
  $scope.room = $scope.rooms[roomId];
  console.log($scope.room);
  var price = $scope.room.price;
     console.log(price);
     $scope.notice = OrderFactory.orderInfo.notice;      //住店须知
     $scope.prompt = OrderFactory.orderInfo.prompt;      //温馨提示
     $scope.arriveTime = "14:00-次日04：00";             //到店时间
     $scope.name = OrderFactory.orderInfo.customerName;  //入住人姓名
     $scope.phone = OrderFactory.orderInfo.customerPhone;//电话
     $scope.beginTime = Calendar.beginDate;              //住店日期
     $scope.endTime = Calendar.endDate;                  //离店日期
     $scope.repeatSelect = 1;
     $scope.counts =[
     {value:'7'},{value:'6'},{value:'5'},{value:'4'},
     {value:'3'},{value:'2'},{value:'1'},
     ];

     //定义get数据
     var beginTime = Calendar.beginDate;
     var endTime = Calendar.endDate;
     var repeatSelect = $scope.repeatSelect;
     var name = $scope.name;
     var phone = $scope.phone;

      $scope.totalPay = parseInt(price)*parseInt($scope.repeatSelect);
      console.log($scope.totalPay);
      $scope.credit = parseInt($scope.totalPay)/parseInt(OrderFactory.orderInfo.credit);//得到的积分

      $scope.$watch($scope.repeatSelect,function (newValue,oldValue,scope) {
        $scope.totalPay = parseInt(price)*parseInt(newValue);
        $scope.credit = parseInt($scope.totalPay)/parseInt(OrderFactory.orderInfo.credit);
     });

     $scope.submitOrder = function() {
       $http.get('api.php/Api/Order/addList',{params:{room_id:roomId,begin_time:beginTime,end_time:endTime,customer_name:name,sustomer_phone:phone,count:repeatSelect}})
        .success(function(data,status){
         if (data.statue ==='success') {
          var orderId = data.order_id;
           console.log(orderId);
         }
         else{
          alert('数据错误');
         }
         })
        .error(function(data,status){
           alert('没有找到该方法');
        });
     }
   });