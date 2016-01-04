<?php
/**
 * 房型管理
 * panjie
 * 2015.12.29
 * 3792535@qq.com
 */
namespace Room\Model;

use Yunzhi\Model\YunzhiModel;

class RoomModel extends YunzhiModel
{
	protected $maps 	= array("status"=>0);					//默认条件
	protected $orderBys = array("sort"=>"desc", "id"=>"desc");	//默认排序 
	protected $_auto 	= array(
		array("status", "0"),	//新增给0
	);

	protected $_validate = array(
		array('title', 'require', 'title can not empty',3),
		array('price', '/^[1-9]\d*$/', 'price must more than 0',3),
		array('total_rooms','/^[1-9]\d*$/', 'Total rooms must be more than 0', 3),
	);
}