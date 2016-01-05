<?php
/**
 * 预订信息
 * panjie
 */
namespace Order\Model;

use Yunzhi\Model\YunzhiModel;

class OrderModel extends YunzhiModel
{
	protected $_auto = array(
		array("order_time", "time", 1, "function"),
	);
}