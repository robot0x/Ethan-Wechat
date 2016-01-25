<?php
namespace Home\Controller;

use Think\Controller;
use CustomMenu\Model\CustomMenuModel;
use Home\Model\Index\indexModel;
use Api\Controller\WxPayController;

class IndexController extends Controller {

    public function indexAction(){
        $this->display();
    }

    public function indexAppJsAction()
    {
    	$M = new indexModel();
    	$this->assign("M", $M);

    	$this->display("indexApp.js");
    }

    public function unitTestAction()
    {
    	$M = new WxPayController();
    	$M->orderPay();
    }
}