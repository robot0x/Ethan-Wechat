app.config(function($stateProvider,$provide,$httpProvider, $urlRouterProvider,$ionicConfigProvider, $compileProvider){
    //用$ionicConfigProvider解决了安卓手机上的导航在顶部的bug
    $ionicConfigProvider.platform.ios.tabs.style('standard');
    $ionicConfigProvider.platform.ios.tabs.position('bottom');
    $ionicConfigProvider.platform.android.tabs.style('standard');
    $ionicConfigProvider.platform.android.tabs.position('standard');

    $ionicConfigProvider.platform.ios.navBar.alignTitle('center');
    $ionicConfigProvider.platform.android.navBar.alignTitle('left');
  
    //隐藏后台标题,设置后退图标,设置后退标题
    $ionicConfigProvider.platform.ios.backButton.previousTitleText('').icon('ion-ios-arrow-back').previousTitleText(false);
    $ionicConfigProvider.platform.android.backButton.previousTitleText('').icon('ion-ios-arrow-back').previousTitleText(false);

    //设置后退按钮标题为空
    $ionicConfigProvider.backButton.text('');
    
    $ionicConfigProvider.platform.ios.views.transition('ios');
    $ionicConfigProvider.platform.android.views.transition('android');
    $compileProvider.imgSrcSanitizationWhitelist(/^\s*(wxlocalresource):/);

    $httpProvider.interceptors.push(function($rootScope) {
    return {
      request: function(config) {
        $rootScope.$broadcast('loading:show')
        return config
      },
      response: function(response) {
        $rootScope.$broadcast('loading:hide')
        return response
      }
    }
  });