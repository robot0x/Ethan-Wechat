<?php
/**
 * 订单详情
 * panjie
 */
namespace Admin\Model\Order;

use User\Logic\UserLogic;			//用户
use Customer\Logic\CustomerLogic;	//客户

class DetailModel
{
	public $order;	//订单

	/**
	 * 通过userid获取用户姓名
	 * @param  id $userId 
	 * @return string       
	 */
	public function getUserNameByUserId($userId)
	{
		$UserL = new UserLogic();
		return $UserL->getNameById($userId);
	}

	/**
	 * 通过customerId来获取客户昵称
	 * @param  string(28) $customerId 
	 * @return string             
	 */
	public function getNickNameById($customerId)
	{
		$CustomerL = new CustomerLogic();
		return $CustomerL->getNickNameById($customerId);
	}
}