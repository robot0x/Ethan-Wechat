<?php
/**
 * 房型管理
 * panjie
 */
namespace Api\Controller;

use Room\Logic\RoomLogic;	//房型

class RoomController extends ApiController
{
	public function getRoomsAction()
	{	
		return $this->ajaxReturn($this->getRooms());
		
	}

	public function getRooms()
	{
		$RoomL = new RoomLogic();
		$rooms = $RoomL->getAllListsWithRemainingCount();

		$data = array("status"=>"success");
		$data['data'] = $rooms;

		return $data;
	}
}