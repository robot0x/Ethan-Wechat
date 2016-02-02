<?php
namespace Home\Controller;

use Think\Controller;
use WxPay\Logic\JsApiPayLogic;

class HomeController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        session(array('expire'=>360000));//设置过期时间100小时
    }
}