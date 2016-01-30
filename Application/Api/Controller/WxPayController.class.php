<?php
namespace Api\Controller;

use WxPay\Logic\JsApiPayLogic;             //H5页面调用API接口
use WxPay\Logic\ApiLogic;               //微支付api统一接口
use WxPay\Logic\UnifiedOrderLogic;      //统一下单
use Order\Logic\OrderLogic;             //订单
use WxPay\Logic\OrderQueryLogic;        //订单查询
use Trade\Logic\TradeLogic;                 //支付信息

class WxPayController extends ApiController
{   
    /**
     * 支付订单
     * todo:订制出错信息
     * @return [type] [description]
     */
    public function orderPayAction()
    {   
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
            $return['status'] = "error";
            $return['message'] = "can not fetch openid";
            echo json_encode($return);
            return;
        }

        //取订单信息,查看是否可支付.
        $orderId = I('get.id');

        //获取支付信息,判断当前订单是否可支付
        $OrderL = new OrderLogic();

        //不可支付，直接跳转支付结果页面.
        if (!$order = $OrderL->checkOrderCanBePayById($orderId))
        {
            $return['status']   = "error";
            $return['message']  = "订单支付过程发生错误，错误信息:" . $OrderL->getError();
            echo json_encode($return);
            return;
        }
        if ($order['end_time'] = $order['begin_time'])
        {
            $totalDays = 1;
        }
        else
        {
            $totalDays = (int)ceil((($order['end_time'] - $order['begin_time']) / 24*60*60));
        }

        //总价(单位为分)
        $totalPrice = $order['price'] * $order['count'] * $totalDays;
        
        //商品描述
        $body   = '洛克酒店:' . $order["_room"]["title"] . '*' . $order['count'] . '间。';

        //商品详情
        $attach = '入住日期:'
                 . date("Y-m-d", $order['begin_time']) 
                 . '。退房日期:' 
                 . date("Y-m-d", $order['end_time'])
                 . '。';

        //订单编号,用日期+N+订单号的形式，方便接收后进行查找相关订单ID
        $tradeNo = C("MCHID").date("YmdHis").'N'.$order['id'];

        //存新订单号
        $order['trade_no'] = $tradeNo;
        $OrderL->saveList($order);

        //TODO:异步通知地址，回头再写

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
    
        $return['status'] = "success";
        $return['data'] = $jsApiParameters;
        // dump($order);
        echo json_encode($return);
    }  


    /**
     * 查询订单
     * @param  [type] $transactionId [description]
     * @return [type]                [description]
     */
    public function queryOrderAction()
    {
        $return = array();
        $orderId = I('get.order_id');
        $OrderL = new OrderLogic();
        if (!$order = $OrderL->getListById($orderId))
        {
            $return['status'] = "error";
            $return['message'] = "获取订单信息时发生出错";
            echo json_encode($return);
            return;
        }
        
        $trade_no = $order['trade_no'];

        //查询订单,设置trade_no
        $OrderQueryL = new OrderQueryLogic();
        $OrderQueryL->SetOut_trade_no($trade_no);

        //进行订单查询
        $result = ApiLogic::orderQuery($OrderQueryL);

        //将支付信息写入数据库
        $TradeL = new TradeLogic();
        if (!$TradeL->getListByOutTradeId($result['out_trade_no']))
        {
            preg_match('/N(.*)/',$result['out_trade_no'],$matched);
            $result['order_id'] = $matched[1];
            $TradeL->saveList($result);
        }

        //根据返回状态，判断返回值
        $return = array();
        if(array_key_exists("return_code", $result)
            && array_key_exists("result_code", $result)
            && $result["return_code"] == "SUCCESS"
            && $result["result_code"] == "SUCCESS")
        {
            //将订单状态设置为已支付
            $order['is_pay']    = 1;
            $order['pay_time']  = time();
            $OrderL->saveList($order);
            $return['status']   = "success";
        }
        else
        {
            $return['status'] = 'error';
            $return['message'] = $result['err_code_des'];  
        }
        echo json_encode($return);
        return;
    }
}