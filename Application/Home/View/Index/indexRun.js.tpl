app.run(function($rootScope, $ionicLoading) {
  $rootScope.$on('loading:show', function() {
    $ionicLoading.show({template: 'foo'})
  });

  $rootScope.$on('loading:hide', function() {
    $ionicLoading.hide();
  });
})