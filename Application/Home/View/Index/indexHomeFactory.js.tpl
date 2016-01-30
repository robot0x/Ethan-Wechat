app.factory('HomeFactory' ,function($http){
    var data = {};
    data.slideUrls      = {:json_encode($M->slideUrls)};    //幻灯片URL
    data.slideMapUrl    = "{:$M->slideMapUrl}";  //地图URL
    return data;
});