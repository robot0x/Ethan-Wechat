app.factory('IntroductionFactory', function(){
	var introduction = {:$M->getHotalIntroduction()};
	return {
		"introduction" :introduction,
	};
})