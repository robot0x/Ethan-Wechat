<?php
/**
 * 现场出房
 * 
 */
namespace Sale\Logic;

use Sale\Model\SaleModel;	//出房
use Order\Logic\OrderLogic;	//订单
use Room\Logic\RoomLogic;	//房型

class SaleLogic extends SaleModel
{


	public function getReminingListsInRange($beginTime, $endTime)
	{

		$RoomL = new RoomLogic();
		$rooms = $RoomL->getAllLists();

		$beginTime 	= date_to_int($beginTime);
		$endTime	= date_to_int($endTime);

		$OrderL = new OrderLogic();
		$orders = group_by_key($OrderL->getOrderedListInDateRange($beginTime, $endTime), "room_id");

		foreach($rooms as $key => $room)
		{
			$id = $room['id'];
			$totalCount = 0;
			foreach($orders["$id"] as $order)
			{
				$totalCount += $order['count'];
			}
			$rooms["$key"]["remaining"] = $room['total_rooms'] - $totalCount;
		}
		return $rooms;
	}
	/**
	 * 删除记录：执行的实为冻结操作
	 * @param  int $id 要冻结的ID
	 * @return 成功 返回操作id 失败:false
	 */
	public function deleteList($id)
	{
		try {
			$data = array();
			$data['id'] = (int)$id;
			$data['status'] = 1;
			if ($this->create($data))
			{
				return $this->save();
			}
			else 
			{
				$this->setError("data delete error: " . $this->getError());
				return false;
			}
		}
        catch (\Think\Exception $e)
        {
            $this->setError = $e->getMessage();
            return false;
        }
	}
}