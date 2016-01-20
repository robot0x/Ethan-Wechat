<script type="text/javascript">
angular.module('edit', []).controller("edit", function($scope, $http) {
    var iniflag = 0;                                        //初始化标致,防止初始化时，二次重复调用数据
    var postUrl = "__ROOT__/admin.php/Sale/getRemainingRoomsAjax.html"; //POST数据提交url
    
    //初始化form数据
    $scope.formData = {
        begin_time: "{:I('get.begin_time') ? I('get.begin_time') : date('Y-m-d')}",
        end_time: "{:I('get.end_time') ? I('get.end_time') : date('Y-m-d',time()+24*60*60)}"
    };                                                          //开始、结束信息
    $scope.count        = 1;                                    //预订数量
    $scope.counts       = new Array();                          //预订数量，数组《供选择》
    $scope.rooms        = new Array();                          //房型信息
    $scope.room_id      = "{:I('get.id') ? I('get.id') : 0}";   //房间ID
    $scope.days         = 0;                                    //总天数
    $scope.per_price    = 0;                                    //预订房型单价
    $scope.showSubmit   = 0;                                    //是否显示提交

    //间数量变为前台可以select选择的数组
    var getCounts = function(index) {
        var counts = new Array();
        var i = 0;
        while (i < index) {
            counts.push(++i);
        }
        return counts;
    }

    //查询房间
    var query = function() {
        var beginTime   = new Date($scope.formData.begin_time);
        var endTime     = new Date($scope.formData.end_time);
        var iniflag     = 0;
        $scope.days     = Math.abs(endTime - beginTime) / (60 * 60 * 24 * 1000);
        $http({
            method: 'POST',
            url: postUrl,
            data: $.param($scope.formData),
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).success(function(data) {
            console.log(data);
            if (data.status == "success") {
                $scope.rooms = data.data;
                roomIdChange();
            }
        });
    };

    $scope.$watch("formData.begin_time", function() {
        if (!iniflag++)
        {
            return;
        }
        query();
    });

    $scope.$watch("formData.end_time", function() {
        query();
    });

    $scope.test = function() {
        console.log($scope.per_price);
        console.log($scope.room_id);
        console.log($scope.days);
    }

    //房间变化，带来价格变化
    $scope.$watch("room_id", function() {
        roomIdChange();
    });

    $scope.$watch("count", function() {
        $scope.total_pay = $scope.count * $scope.per_price * $scope.days;
    });

    $scope.$watch("days", function() {
        $scope.total_pay = $scope.count * $scope.per_price * $scope.days;
    });

    $scope.$watch("total_pay", function() {
        if ($scope.total_pay > 0) {
            $scope.showSubmit = 1;
        } else {
            $scope.showSubmit = 0;
        }
    });

    //房型改变后，重置单价、总价、可选间数
    var roomIdChange = function()
    {
        for (var i = 0, len = $scope.rooms.length; i < len; i++) {
            if ($scope.room_id === $scope.rooms[i].id) {
                $scope.per_price    = fToy($scope.rooms[i].price);
                $scope.counts       = getCounts($scope.rooms[i].remaining);
                $scope.total_pay    = $scope.count * $scope.per_price;
                break;
            }
        }
    };

});
</script>
