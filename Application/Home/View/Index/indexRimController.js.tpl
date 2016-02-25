app.controller('rimCtrl', function($scope) {
    //查询列表
    $scope.keywords = [
        {"title":"美食", "classTitle":"active"},
        {"title":"景点", "classTitle":""},
        {"title":"公交", "classTitle":""},
        {"title":"地铁", "classTitle":""},
    ];
    var keywordTitle    = $scope.keywords[0].title;                 //初始化查询关键字
    var map             = new BMap.Map("rimMap");                   //实例化
    var point           = new BMap.Point(117.223579,39.119671);     //洛克酒店位置
    map.centerAndZoom(point, 14);                                 //生成地图
    var local           = new BMap.LocalSearch(map, {
        renderOptions:{map: map}
    });                                                         //实始化地图查询对象

    //设置洛克图标
    var myIcon = new BMap.Icon("__IMG__/post.png", new BMap.Size(300,157));
    var marker = new BMap.Marker(point,{icon:myIcon});          // 创建标注
    map.addOverlay(marker);                                     // 将标注添加到地图中

    local.search(keywordTitle);                                  //初始化查询

    $scope.keyworkChang = function(keyword){

        //如果关键字没有变化，直接返回
        if (keyword.title == keywordTitle)
        {
            return;
        }

        //重新给值
        keywordTitle = keyword.title;

        //有变化，将历史class置空，　将当前class置为activated
        $scope.keywords.forEach(function(element, index){
            if (element == keyword)
            {
                element.classTitle = "active";
            }
            else
            {
                $scope.keywords[index].classTitle = "";
            }
        });

        //重新加载search
        local.search(keywordTitle);
    };
});
