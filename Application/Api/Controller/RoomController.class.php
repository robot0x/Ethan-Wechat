<?php
/**
 * 房型管理
 * panjie
 */
namespace Api\Controller;

use Room\Logic\RoomLogic;	//房型

class RoomController extends ApiController
{
	/**
	 * 或取房型信息
	 * panjie
	 * @return ajaxList 
	 */
	public function getRoomsAction()
	{	
		return $this->ajaxReturn($this->getRooms());
	}

	/**
	 * 获取房型信息(全部取出，包括剩余间数)
	 * panjie
	 * @return lists
	 */
	public function getRooms()
	{
		//实例化
		$RoomL = new RoomLogic();
		$rooms = $RoomL->getAllListsWithTimeRange(I('get.begin_time'), I('get.end_time'));


		$data = array("status"=>"success");
		$data['data'] = $rooms;

		return $data;
	}

	/**
	 * 获取一条房间信息
	 * xulinjie
	 * @return list
	 */
	public function getRoomList()
	{
		$roomId = I('get.roomId');
		$RoomL = new RoomLogic();
		$room = $RoomL->getListById($roomId);

		$data = array("status"=>"success");
		$data['data'] = $room;
		
		return $data;
	}
}