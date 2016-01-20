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
	protected $sale;
	/**
	 * 进行保存信息前的验证
	 * @return  $this
	 */
	public function checkAvailabe($sale)
	{
		if ($this->error !== "")
		{
			return $this;
		}
		$this->sale = $sale;

		//初始化
		$beginTime 	= date_to_int($sale["begin_time"]);
		$endTime 	= date_to_int($sale["end_time"]);
		$count 		= (int)$sale["count"];
		$roomId 	= (int)$sale["room_id"];

		if (!$count)
		{
			$this->setError("The order count must by bigger than 0(预订房间数必须大于0)");
			return $this;
		}

		//时间大小互换
		if ($beginTime > $endTime)
		{
			$temp 		= $beginTime;
			$beginTime 	= $endTime;
			$endTime 	= $temp;
		}

		//开始日期必须小于当天
		if ($beginTime < date_to_int(date("Y-m-d")))
		{
			$this->setError("beginTime must be bigger than today(预订开始日期必须大于当前日期)");
			return $this;
		}

		//判断是否有足够的剩余房间
		$rooms = $this->getReminingListsInRange($sale["begin_time"], $sale["end_time"]);
		foreach($rooms as $key => $room)
		{
			if ($room["id"] == $roomId)
			{
				if ($room['remaining'] < $count)
				{
					$this->setError("The remaining room count is smaller than $count(房间可供预订数量不足)");
				}
				else
				{
					return $this;
				}
			}
		}

		$this->setError("this id: $room_id is not found!(预订的房型ID$room_id未找到");
		return $this;
	}

	//添加订单信息
	//return $this
	public function addOrder($sale = null)
	{
		if ($this->error !== "")
		{
			return $this;
		}
		if (isset($sale))
		{
			$this->sale = $sale;
		}
		if (!isset($this->sale))
		{
			$this->setError("slae is null(未传入参数或传入的参数类型为null)");
			return $this;
		}

		$roomId = $this->sale["room_id"];
		$RoomL = new RoomLogic();
		if (!$room = $RoomL->getListById($roomId))
		{
			$this->setError("can't fetch room info （未能获取正确的房型信息Id:$roomId）");
			return $this;
		}

		$order = array();
		$order["begin_time"] 		= date_to_int($this->sale['begin_time']);
		$order["end_time"] 			= date_to_int($this->sale["end_time"]);
		$order["type"]				= "offline";
		$order["room_id"]			= $roomId;
		$order["is_pay"] 			= 1;
		$order["pay_time"] 			= time();
		$order["price"] 			= (int)$room["price"];
		$order["count"] 			= $this->sale["count"];
		$order["customer_name"] 	= $this->sale["customer_name"];
		$order["customer_phone"] 	= $this->sale["customer_phone"];

		$OrderL = new OrderLogic();
		if (!$OrderL->saveList($order))
		{
			$this->setError("SaleL save error,message(订单保存失败，错误信息): "  . $OrderL->getError());
			return $this;
		}

		return $this;
	}

	/**
	 * 支付信息
	 * 现场出票，不涉及支付环节。直接返回
	 */
	public function addPay()
	{
		if ($this->error !== "")
		{
			return $this;
		}
		return $this;
	}
	/**
	 * 去除数量为0的房间
	 * @param   $lists 
	 * @return lists      
	 */
	public function removeZeroRooms($lists)
	{
 		$return = array();
        foreach($lists as $key => $value)
        {
            if($value["remaining"] != '0')
            {
                $return[] = $lists["$key"];
            }
        }
        return $return;
	}

	/**
	 * 获取在指定日期范围内的所有的房间信息
	 * @param  string $beginTime 2015-12-21
	 * @param  sting $endTime   2016-2-3
	 * @return lists            
	 */
	public function getReminingListsInRange($beginTime = null, $endTime = null)
	{
		//初始化
		if ($beginTime == "" || $beginTime == null)
		{
			$beginTime = date("Y-m-d");
		}
		if ($endTime == "" || $endTime == null)
		{
			$endTime = date("Y-m-d", time()+24*60*60);
		}

		//取房型信息
		$RoomL 		= new RoomLogic();
		$rooms 		= $RoomL->getLists();

		//取预订信息
		$beginTime 	= date_to_int($beginTime);
		$endTime	= date_to_int($endTime);
		$OrderL 	= new OrderLogic();
		$orders 	= group_by_key($OrderL->getAllOrderedListsInDateRange($beginTime, $endTime), "room_id");

		//按房型依次计算剩余信息
		foreach($rooms as $key => $room)
		{
			$id = $room['id'];
			$totalCount = 0;
			foreach($orders["$id"] as $order)
			{
				//如果预订未取消且已支付，则计算售卖总数
				if ($order['is_cancel'] == 0 && $order['is_pay'] == 1)
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