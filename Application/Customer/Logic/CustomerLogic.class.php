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

	private function addCustomer($data){
		//对性别进行转换
		if ($data['sex'] == 0) {
			$data['sex'] = "女";
		}else{
			$data['sex'] = "男";
		}

		$data['is_subscribe'] = $data['subscribe'];

		return $this->add($data);
	}

	private function saveCustomer($data){
		//对性别进行转换
		if ($data['sex'] == 0) {
			$data['sex'] = "女";
		}else{
			$data['sex'] = "男";
		}

		$data['is_subscribe'] = $data['subscribe'];

		$map = array();
		$map['openid'] = $data['openid'];
		return $this->where($map)->save($data);
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
	 * @return array 第一项为添加数据的数目，第二项为修改数据的数目
	 */
	public function synchro($customers){
		//将customers与lists对比后分为两个数组add和save中
		$adds = array();
		$saves = array();
		$lists = $this->getLists();

		
		foreach ($customers as $key => $customer) {
			$i = count($lists);
			foreach ($lists as $key => $list) {

				if ($customer['openid'] == $list['openid']) {
					$saves[] = $customer;
				}else{
					--$i;
				}
			}
			if ($i == 0) {
				$adds[] = $customer;
			}
		}

		//将没有的数据进行添加
		$count = array();
		foreach ($adds as $key => $add) {
			$result[] = $this->addCustomer($add);
			$count['add'] = count($result);
		}
		
		//对已有的数据进行改正
		foreach ($saves as $key => $save) {
			$count['save'] = $this->saveCustomer($save);
		}
		//返回添加数目，改正数目
		return $count;
	}
}