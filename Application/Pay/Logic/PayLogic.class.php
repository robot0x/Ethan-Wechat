<?php
/**
 * 前台微信支付模块
 * denghaoyang
 */
namespace Pay\Logic;

use Pay\Model\PayModel;
use Pay\Logic\WxPayLogic;
use Pay\Logic\JsapiPayLogic;
use Pay\Logic\WxOrderLogic;

class PayLogic extends PayModel
{
	public function index(){

		$WxOrderL = new WxOrderLogic();
		$WxOrderL->SetBody("test");
		$WxOrderL->SetAttach("test");
		$WxOrderL->SetOut_trade_no(WxPayConfig::MCHID.date("YmdHis"));
		$WxOrderL->SetTotal_fee("1");
		$WxOrderL->SetTime_start(date("YmdHis"));
		$WxOrderL->SetTime_expire(date("YmdHis", time() + 600));
		$WxOrderL->SetGoods_tag("test");
		$WxOrderL->SetNotify_url("http://paysdk.weixin.qq.com/example/notify.php");
		$WxOrderL->SetTrade_type("JSAPI");
		$WxOrderL->SetOpenid($openId);

		$WxPayL = new WxPayLogic;
		$order = $WxPayL->unifiedOrder($WxOrderL);
		printf_info($order);
	}
}