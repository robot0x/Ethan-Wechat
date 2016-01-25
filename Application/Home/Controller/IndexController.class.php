<?php
namespace Home\Controller;
use CustomMenu\Model\CustomMenuModel;
use Home\Model\Index\indexModel;
use Api\Controller\WxPayController;
use WxPay\Logic\JsApiPayLogic;      //微信JSAPI

class IndexController extends HomeController {

    /**
     * 首页
     * @return [type] [description]
     */
    public function indexAction(){
        //①、获取用户openid
        $tools = new JsApiPayLogic();
        $openId = $tools->GetOpenid();

        //session, 以indexAppJsAction共享
        session("jsOpenId", $openId);
        $this->display();
    }

    /**
     * 项目JS文件
     * @return [type] [description]
     */
    public function indexAppJsAction()
    {
    	$M = new indexModel();
        $M->setOpenId(session("jsOpenId"));
    	$this->assign("M", $M);

    	$this->display("indexApp.js");
    }

    public function unitTestAction()
    {
    	$M = new WxPayController();
    	$M->orderPay();
    }
}