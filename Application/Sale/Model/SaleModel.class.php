<?php
/**
 * 现场售卖
 * panjie
 * 2015.12.29
 * 3792535@qq.com
 */
namespace Sale\Model;

use Yunzhi\Model\YunzhiModel;

class SaleModel extends YunzhiModel
{
	protected $_auto = array(
		array("status", "0", 1),	//新增给0
		array('order_time', "time", 1, 'function'), //新增至time为当前时间
	);

	protected $_validate = array(
		array('title', 'require', 'title can not empty',3),
		array('per_price', '/^[1-9]\d*$/', 'per_price must more than 0',3),
		array('pay_price','/^[1-9]\d*$/', 'pay_price must be more than 0', 3),

	);
}