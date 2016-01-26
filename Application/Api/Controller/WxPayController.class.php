<?php
namespace Api\Controller;

use WxPay\Logic\JsApiLogic;             //H5页面调用API接口
use WxPay\Logic\ApiLogic;               //微支付api统一接口
use WxPay\Logic\UnifiedOrderLogic;      //统一下单

class WxPayController extends ApiController
{   
    /**
     * 支付订单
     * @return [type] [description]
     */
    public function orderPay()
    {   
        $return = array();

        //判断传入的OPENID
        $openid = I('get.openid');
        // if (strlen($openid) != 28)
        // {
        //     $return['state'] = "error";
        //     $return["message"] = "wrong openid";
        //     return $return;
        // }

        //取订单信息,查看是否可支付.
        //可支付状态，则锁定房型。TODO:需要增加ordering字段
        //取预支付信息，并返回给前台
        $UnifiedOrderL = new UnifiedOrderLogic();
        $UnifiedOrderL->SetBody("test");
        $UnifiedOrderL->SetAttach("test");
        $UnifiedOrderL->SetOut_trade_no(C("MCHID").date("YmdHis"));
        $UnifiedOrderL->SetTotal_fee("1");
        $UnifiedOrderL->SetTime_start(date("YmdHis"));
        $UnifiedOrderL->SetTime_expire(date("YmdHis", time() + 600));
        $UnifiedOrderL->SetGoods_tag("test");
        $UnifiedOrderL->SetNotify_url("http://paysdk.weixin.qq.com/example/notify.php");
        $UnifiedOrderL->SetTrade_type("JSAPI");
        $UnifiedOrderL->SetOpenid($openId);
        
        $order = ApiLogic::unifiedOrder($UnifiedOrderL);
        dump($order);

    }
}