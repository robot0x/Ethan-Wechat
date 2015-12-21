<?php
namespace WechatInterface\Controller;

use Think\Controller;
use WechatInterface\Logic\wechatInterfaceapiLogic;
use WechatInterface\Logic\wechatMenuapiLogic;
use WechatInterface\Logic\wechatCallbackapiLogic;
use CustomMenu\Logic\CustomMenuLogic;

class IndexController extends Controller { 
    
    public function indexAction(){
          
        //初始化消息回复
        $callbackL = new wechatCallbackapiLogic();

        if (isset($_GET['echostr'])) {
          $callbackL->valid();
        }else{
          $callbackL->responseMsg();
        }

    }
}