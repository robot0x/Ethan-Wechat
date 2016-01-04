<?php
/**
 * 客户管理
 */
namespace Api\Controller;

use Customer\Logic\CustomerLogic;	//客户

class CustomerController extends ApiController
{
	/**
	 * 获取个人信息
	 * @return jsonArray 
	 * headimgurl:用户头像URL
	 * nickname:用户昵称
	 */
	public function getPersonalAction()
	{
		return $this->ajaxReturn($this->getPersonal());
	}

	public function getPersonal()
	{
		$CustomerL = new CustomerLogic();
		if ($customer = $CustomerL->getListById(I('get.id')) )
		{
			$data = array("status"=>"success");
			$data['data']['headimgurl'] = $customer['headimgurl'];
			$data['data']['nickname'] = $customer['nickname'];
		}
		else
		{
			$data = array("status"=>"error");
			$data['data']['message'] = "error: " . $CustomerL->getError();
		}

		return $data;
	}
}