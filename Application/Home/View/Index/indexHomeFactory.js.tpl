app.factory('HomeFactory' ,function($http){
    var data = {};
    data.slideUrls      = {:$M->home['slideUrls']};    //幻灯片URL
    data.slideMapUrl    = {:$M->home['slideMapUrl']};  //地图URL
    return data;
});