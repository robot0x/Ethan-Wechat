app.filter('trustHtml', function ($sce) {
  return function (input) {
      return $sce.trustAsHtml(input);
  }

});

app.filter('fenToYuan', function(){
    return function(input){
        return fToy(input);
    };
});