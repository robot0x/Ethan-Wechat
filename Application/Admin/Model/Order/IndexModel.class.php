<?php
/**
 * 订单管理Index
 * panjie
 */
namespace Admin\Model\Order;

use Room\Logic\RoomLogic;

class IndexModel
{
	public $orders 		= null;	//订单信息
	protected $rooms 	= null;	//房型信息
	public function __construct()
	{
		$RoomL 			= new RoomLogic();
		$this->rooms 	= change_key($RoomL->getAllLists(), "id");
	}

	public function getRoomTitleById($id)
	{
		return $this->rooms["$id"]["title"];
	}
}