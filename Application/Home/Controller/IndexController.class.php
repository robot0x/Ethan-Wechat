<?php
namespace Home\Controller;
use CustomMenu\Model\CustomMenuModel;
use Home\Model\Index\indexModel;
use Api\Controller\WxPayController;
use WxPay\Logic\JsApiPayLogic;      //微信JSAPI
use Jssdk\Logic\JssdkLogic;         //jssdk

class IndexController extends HomeController {

    /**
     * 首页
     * @return [type] [description]
     */
    public function indexAction(){
        //①、获取用户openid并seesion
        // $JsApiPayL = new JsApiPayLogic();
        // $JsApiPayL->sessionOpenid();

        // JssdkLogic::sessionUrl();

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

    public function unitTestAction()
    {
    	$M = new indexModel();
    	dump($M->getJssdk());
    }
}