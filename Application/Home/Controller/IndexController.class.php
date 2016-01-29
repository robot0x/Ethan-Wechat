<?php
namespace Home\Controller;
use CustomMenu\Model\CustomMenuModel;
use Home\Model\Index\indexModel;
use Api\Controller\WxPayController;
use WxPay\Logic\JsApiPayLogic;      //微信JSAPI
use Jssdk\Logic\JssdkLogic;         //jssdk
use Order\Logic\OrderLogic;         //订单
use WxPay\Logic\UnifiedOrderLogic;  //微信支付，统一下单
use WxPay\Logic\ApiLogic;           //微信支付API

class IndexController extends HomeController {

    /**
     * 首页
     * @return [type] [description]
     */
    public function indexAction(){


        //获取用户openid并seesion
        $JsApiPayL = new JsApiPayLogic();
        $JsApiPayL->sessionOpenid();

        //将当前URL缓存，用于API进行签名时调用
        JssdkLogic::sessionUrl();

        $this->display();
    }

    /**
     * 项目JS文件
     * @return [type] [description]
     */
    public function indexAppJsAction()
    {
    	$M = new indexModel();
        //$M->setOpenId(session("openId"));
    	$this->assign("M", $M);

    	$this->display("indexApp.js");
    }

    /**
     * 微信支付
     * 传入订单号
     * 如果可支付，则直接支付，不可以支付，跳转至支付失败界面
     * 支付后，跳转到支付结果页面。并按返回值出支付是否成功的提示.
     * @return [type] [description]
     */
    public function orderPayAction()
    {
        $orderId = I('get.orderId');

        //获取支付信息,判断当前订单是否可支付
        $OrderL = new OrderLogic();

        //不可支付，直接跳转支付结果页面.
        if (!$order = $OrderL->checkOrderCanBePayById($orderId))
        {
            echo $OrderL->getError();
            
        }
        //总价(单位为分)
        $totalPrice = $order['price'] * $order['count'];

        $openId = I('get.open_id');
        if ($openId == "")
        {
            //获取用户openid并seesion
            $JsApiPayL = new JsApiPayLogic();
            $JsApiPayL->sessionOpenid();
            $openId = session("openId");
        }

        if ($openId == null)
        {
            $this->error("Sorry, Can't fetch openId", U('index'));
        }
        
        //商品描述
        $body   = '房型:' . $order["_room"]["title"] . '*' . $order['count'] . '间。';

        //商品详情
        $attach = '入住日期:'
                 . date("Y-m-d", $order['begin_time']) 
                 . '。退房日期:' 
                 . date("Y-m-d", $order['end_time'])
                 . '。';

        //订单编号,用日期+N+订单号的形式，方便接收后进行查找相关订单ID
        $tradeNo = C("MCHID").date("YmdHis").'N'.$order['id'];

        //todo:可支付状态，则锁定房型。需要增加ordering字段
        //取预支付信息
        $UnifiedOrderL = new UnifiedOrderLogic();
        $UnifiedOrderL->SetBody($body);
        $UnifiedOrderL->SetAttach($attach);
        $UnifiedOrderL->SetOut_trade_no($tradeNo);
        $UnifiedOrderL->SetTotal_fee((string)$totalPrice);
        $UnifiedOrderL->SetTime_start(date("YmdHis"));
        $UnifiedOrderL->SetTime_expire(date("YmdHis", time() + 600));
        $UnifiedOrderL->SetGoods_tag("test");
        $UnifiedOrderL->SetNotify_url("http://paysdk.weixin.qq.com/example/notify.php");
        $UnifiedOrderL->SetTrade_type("JSAPI");
        $UnifiedOrderL->SetOpenid($openId);

        //生成统一支付信息
        $unifiedOrder = ApiLogic::unifiedOrder($UnifiedOrderL);

        //生成支付参数
        $JsApiPayL = new JsApiPayLogic();
        $jsApiParameters = $JsApiPayL->GetJsApiParameters($unifiedOrder);

        //将支付参数传给前台
        $this->assign("jsApiParameters",$jsApiParameters);
        $this->display("orderPay");
        
    }

    public function payAction()
    {
        $this->orderPayAction();
    }
    
    public function unitTestAction()
    {
    	$M = new indexModel();
    	dump($M->getJssdk());
    }
}