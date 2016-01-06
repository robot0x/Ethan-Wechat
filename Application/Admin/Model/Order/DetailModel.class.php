<?php
/**
 * 订单详情
 */
namespace Admin\Model\Order;

use User\Logic\UserLogic;

class DetailModel
{
	public $order;
	public function getUserNameByUserId($userId)
	{
		$UserL = new UserLogic();
		return $UserL->getNameById($userId);
	}
}