app.controller('IntroductionCtrl', function($scope,Home) {
  
     Home.getJosn().success(function(data){
      if(data.introduction.status==='success'){
        $scope.introduction = data.introduction.data;
      }else{
      alert("幻灯片数据错误");
      }
      });
     });