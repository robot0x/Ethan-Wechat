app.run(function($rootScope, $ionicLoading) {
  $rootScope.$on('loading:show', function() {
    $ionicLoading.show({template: '<ion-spinner></ion-spinner>'})
  });

  $rootScope.$on('loading:hide', function() {
    $ionicLoading.hide();
  });
})