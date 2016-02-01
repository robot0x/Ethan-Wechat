    $stateProvider
    .state('tabs',{
      url: "/tab",
      abstract: true,
      templateUrl: "templates/indexTabs.html"
      })
    .state('tabs.home',{
      url: "/home",
      cache:"false",
      views:{
          //首页
          'home-tab':{
            templateUrl: "templates/indexHome.html"
          }
        }
      })
    .state('tabs.evaluation',{
      url: "/evaluation",
      views:{
          //首页的查看评论
          'home-tab':{
            templateUrl: "templates/indexEvaluation.html"
          }
        }
      })
    .state('tabs.map',{
      url: "/map",
      views:{
          //首页的地图导航页面
          'home-tab':{
            templateUrl: "templates/indexMap.html"
          }
        }
      })
    .state('tabs.evaluationing',{
      url: "/evaluationing",
      views:{
          //评论界面
          'home-tab':{
            templateUrl: "templates/indexEvaluationing.html"
          }
        }
      })
    .state('tabs.success',{
      url: "/success",
      views:{
            //评论成功
            'home-tab':{
              templateUrl: "templates/indexSuccess.html"
            }
          }
        })
    .state('tabs.date',{
      url: "/date",
      views:{
            //选择日期
            'home-tab':{
              templateUrl: "templates/indexDate.html"
            }
          }
        })
    .state('tabs.hotel',{
      url: "/hotel",
      views:{
            //酒店介绍
            'home-tab':{
              templateUrl: "templates/indexHotel.html"
            }
          }
        })
    .state('confirmOrder',{
      url: "/confirmOrder/:roomId",
      templateUrl: "templates/indexConfirmOrder.html"
    })
    .state("tabs.rim",{
      url: "/rim",
      views: {
        "rim-tab":{
              //搜周边
              templateUrl: "templates/indexRim.html"
            }
          }
        })
    .state("tabs.activity",{
      url: "/activity",
      views: {
        "activity-tab":{
              //活动
              templateUrl: "templates/indexActivity.html"
            }
          }
        })
    .state("activityDetail",{
      url: "/activityDetail/:activityId",
      templateUrl: "templates/indexActivityDetails.html"
    })
    .state('tabs.personal', {
      url: "/personal",
      views: {
        'personal-tab': {
          //个人中心
          templateUrl: "templates/indexPersonalCenter.html"
        }
      }
    })
    .state('pay', {
        cache: false,
        url: "/pay/:orderid",
        templateUrl: "templates/indexPay.html",
        controller:'indexPayController',
    })
    .state('tabs.evaluationing1', {
      url: "/evaluationing1",
      views: {
        'personal-tab': {
            //个人中心待评价的评价界面
            templateUrl: "templates/indexEvaluationing.html"
          }
        }
      })
    .state('tabs.success1',{
      url: "/success",
      views:{
            //个人中心待评价的评论成功
            'home-tab':{
              templateUrl: "templates/indexSuccess.html"
            }
          }
        })
    .state('tabs.allOrder', {
      url: "/allOrder/:type",
      views: {
        'personal-tab': {
            //我的订单
            templateUrl: "templates/indexOrder.html"
          }
        }
      });
    $urlRouterProvider.otherwise("/tab/home");
  });