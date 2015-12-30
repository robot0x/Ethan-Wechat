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
	public function addCustomerInfo($object){
		//获取用户信息
		$data = $this->getCustomerInfo($object);
		
		$this->addList($data);
	}

	private function addList($data){
		//对性别进行转换
		if ($data['sex'] == 0) {
			$data['sex'] = "女";
		}else{
			$data['sex'] = "男";
		}

		$data['is_subscribe'] = $data['subscribe'];

		$this->add($data);
	}

	/**
	 * 获取用户的基本信息
	 */
	public function getCustomerInfo($openid){
		$wechatInterface = new wechatInterfaceapiLogic;
		$access_token = $wechatInterface->getAccessToken();
		$url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$access_token."&openid=".$openid."&lang=zh_CN";
		$result = $wechatInterface->https_request($url);
		return json_decode($result,true);
	}

	/**
	 * 调用微信接口获取公共账号用户列表
	 */
	public function getCustomerList(){
		$wechatInterface = new wechatInterfaceapiLogic;
		$access_token = $wechatInterface->getAccessToken();
		$url = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=".$access_token."&next_openid=";
		$result = $wechatInterface->https_request($url);
		return json_decode($result,true);
	}

	/**
	 * 将用户信息列表同步到数据库中
	 * @return int 返回影响的数据条数
	 */
	public function synchro($lists){
		foreach ($lists as $key => $value) {
			$this->addList($value);
			$map = array();
			$map['openid'] = $value['openid'];
			$count = $this->where($map)->save($value);
		}
		return $count;
	}
}