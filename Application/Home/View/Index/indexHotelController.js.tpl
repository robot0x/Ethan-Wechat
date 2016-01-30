app.controller('IntroductionCtrl', function($scope,IntroductionFactory) {
	$scope.introduction = IntroductionFactory.introduction;
});