<?php
namespace Customer\Logic;

use Customer\Model\CustomerModel;
use WechatInterface\Logic\wechatInterfaceapiLogic;

class CustomerLogic extends CustomerModel {

	public function getLists(){
		return $this->select();
	}

	/**
	 * 存储关注用户的基本信息
	 * @param object 触发关注事件post过来的xml信息
	 * @return status 存储状态
	 */
	public function saveCustomerInfo($object){
		//获取用户信息
		$data = $this->getCustomerInfo($object);
		
		//对性别进行转换
		if ($data['sex'] == 0) {
			$data['sex'] = "女";
		}else{
			$data['sex'] = "男";
		}

		$this->add($data);
	}

	/**
	 * 获取用户的基本信息
	 */
	private function getCustomerInfo($object){
		$wechatInterface = new wechatInterfaceapiLogic;
		$access_token = $wechatInterface->getAccessToken();
		$url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$access_token."&openid=".$object->FromUserName."&lang=zh_CN";
		$result = $wechatInterface->https_request($url);
		return json_decode($result,true);
	}

}