<?php
namespace Home\Controller;

use Think\Controller;
use WxPay\Logic\JsApiPayLogic;

class HomeController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        //①、获取用户openid并seesion
        $JsApiPayL = new JsApiPayLogic();
        $JsApiPayL->sessionOpenid();
    }

}