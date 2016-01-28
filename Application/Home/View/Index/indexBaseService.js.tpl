app.service('BaseService', function() {
  var self = this; // Save reference
  this.fenToYuan = function(fen){
      return (parseFloat(fen).div(100));
  };
});