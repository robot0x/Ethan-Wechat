app.factory('OrderFactory' ,function(){
    var titles = {"all":"全部订单", 
                    "toBeStay":"待入住", 
                    "toBeEvaluation":"待评价",
                    "toBePaid":"待支付"
                }; //根据传入的type值，显示不同的TITLE
    var time            = {:strtotime(date("Y-m-d"))};  //取当日0时时间戳
    var datas           = {:$M->getOrders()};           //实始化订单数据
    var toBeStay        = new Array();                  //待入住
    var toBeEvaluation  = new Array();                  //待评论
    var toBePaid        = new Array();                  //待支付

    var init = function(datas){
        datas.forEach(function(Element, index){
            // console.log(Element.is_cancel);
            // console.log(Element.is_pay);
            // console.log(Element.begin_time);
            // console.log(time);
            //如果未取消，未支付，且入住时间是今天或以后，则为待支付订单
            if (Element.is_cancel == '0' && Element.is_pay == '0' && Element.begin_time >= time)
            {
                Element.toBePaid        = 1;
                Element.toBeEvaluation  = 0;
                toBePaid.push(Element);
            }
            //如果已支付，则按情况查看是否为待评价或待入住
            else if (Element.is_pay == '1')
            {
                //如果状态主正常，且开始入住时间大于等于当前时间，则为未入住
                if (Element.is_cancel == '0' && Element.begin_time >= time)
                {
                    Element.toBeStay     = 1;
                    toBeStay.push(Element);
                }
                else
                {
                     Element.toBeStay     = 0;
                }

                //如果未评价，当前时间大于离店时间，则为可评价订单
                if (Element.is_evaluation == 0 && Element.end_time < time)
                {
                    Element.toBeEvaluation  = 1;
                    toBeEvaluation.push(Element);
                }
                else
                {
                    Element.toBeEvaluation  = 0;
                }

                Element.toBePaid        = 0;
            }
        });
    };

    init(datas);//进行数据的初始化，来将几类订单进行分类.该项操作也可以在PHP中计算好后，传给前台。

    return {
        title: function(type){
            return titles[type];        //页面标题
        },
        datas: datas,                   //全部订单数据 
        toBePaid: toBePaid,             //待支付
        toBeEvaluation: toBeEvaluation, //待评论
        toBeStay: toBeStay,             //待入住
    };
});