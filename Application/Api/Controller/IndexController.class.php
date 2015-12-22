<?php
namespace Api\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function getJssdkAction(){
		$jssdk = new JssdkController("wxc92a0067c6338cbf", "bb721eba1ceb506c78f46aa9451e2104");
		$signPackage = $jssdk->GetSignPackage();
		$this->ajaxReturn($signPackage);
	}	
}