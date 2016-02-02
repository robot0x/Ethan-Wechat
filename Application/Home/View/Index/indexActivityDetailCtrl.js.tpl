app.controller('ActivityDetailCtrl',function($scope,$stateParams,$http){
  var activityId = $stateParams.activityId;
   console.log(activityId);
   	$http.get('api.php/Api/Api/getActivityDetail',{params:{id:activityId}})
      .success(function(data,status){
   		if (data.status === 'success') {
   			$scope.activity = data.data;
   		}
   		else{
   			alert('数据错误');
   		}
       })
      .error(function(data,status){
       	alert('没有改方法');
      });
});