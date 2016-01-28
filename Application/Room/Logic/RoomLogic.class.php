<?php
/**
 * 后台幻灯片管理
 * 魏静云
 */
namespace Room\Logic;

use Room\Model\RoomModel;	//房型信息
use Order\Logic\OrderLogic;	//预订信息

class RoomLogic extends RoomModel
{
	/**
	 * 保存数据
	 * panjie
	 * @param  [type] $list [description]
	 * @return [type]       [description]
	 */
	public function saveList($list)
	{
		//元变分
		$list['price'] = (int)100*$list['price'];
		return parent::saveList($list);
	}

	/**
	 * 取一条房间信息
	 * xulinjie
	 * @return 
	 */
	public function getListById($id)
	{
		$map['id'] = $id;
		$data = $this->where($map)->find();
		return $data;
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

	/**
	 * 获取指定日期区间内，加入剩余房间数的列表信息
	 * panjie
	 * @return lists 
	 */

	public function getAllListsWithTimeRange($beginTime = null, $endTime = null)
	{
		//取出所有状态为正常的房型
		$rooms = $this->getAllLists();
		
		//日期格式化，不成功，则进行当日及次日初始化
		if (!$beginTime = date_to_int($beginTime))
		{
			$beginTime = date_to_int(date("Y-m-d"));
		}

		if (!$endTime = date_to_int($endTime))
		{
			$endTime = $beginTime+24*60*60;
		}

		//取出预订信息
		$OrderL = new OrderLogic();
		$orders = $OrderL->getOrderedListsInDateRange($beginTime, $endTime);

		//预订信息按房型ID重新分组
		$orders = group_by_key($orders, $key = "room_id");

		$data = array();
		$i = 0;

		//依次循环，用房型的总数，减去已预订的数量：得出房型可预订数量
		foreach($rooms as $room)
		{

			$id = $room['id'];

			//预订总数
			$orderedTotalCount = 0;
			foreach($orders["$id"] as $order)
			{
				$orderedTotalCount += $order['count'];
			}

			$data[$i]['id'] 				= $room['id'];
			$data[$i]['name'] 				= $room['title'];
			$urls 							= explode(",", $room['url']);
			$data[$i]['url'] 				= $urls[0];
			$data[$i]['price'] 				= $room['price'];
			$data[$i]['description'] 		= $room['description'];
			$data[$i]['detail_description'] = $room['detail_description'];
			$data[$i]['status'] 			= $room['status'];
			$data[$i]['remaining_count'] 	= $room['total_rooms'] - $orderedTotalCount;
			$i++;
		}


		return $data;
	}
}