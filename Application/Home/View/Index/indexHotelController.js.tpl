app.controller('IntroductionCtrl', function($rootScope,$ionicPlatform,$scope,IntroductionFactory) {
$scope.introduction = IntroductionFactory.introduction;
});