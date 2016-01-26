<?php
namespace Api\Controller;

use WxPay\Logic\JsApiPayLogic;             //H5页面调用API接口
use WxPay\Logic\ApiLogic;               //微支付api统一接口
use WxPay\Logic\UnifiedOrderLogic;      //统一下单

class WxPayController extends ApiController
{   
    /**
     * 支付订单
     * @return [type] [description]
     */
    public function orderPayAction()
    {   
        $openId = I('get.open_id');
        if ($openId == "")
        {
            //取session中的OPENID
            $openId = session("openId");
            session("openId", $openId);
        }

        if ($openId == null)
        {
            $return['status'] = "error";
            $return['message'] = "can not fetch openid";
            return json_encode($return);
        }

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
        
        // dump($UnifiedOrderL);

        $order = ApiLogic::unifiedOrder($UnifiedOrderL);

        $JsApiPayL = new JsApiPayLogic();
        $jsApiParameters = $JsApiPayL->GetJsApiParameters($order);
    
        $return['status'] = "success";
        $return['data'] = $jsApiParameters;
        // dump($order);
        echo json_encode($return);
    }
}