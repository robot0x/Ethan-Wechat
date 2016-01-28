<?php
/**
 * 预订信息
 * panjie
 */
namespace Order\Logic;

use Order\Model\OrderModel;
use Sale\Logic\SaleLogic;		//出房
use Room\Logic\RoomLogic;		//房型

class OrderLogic extends OrderModel
{
	protected $map = array(); //查询附加条件

	/**
	 * 取出区间内的当前页预订信息，包括剩余间数
	 * 当前页由get.p传入，并由父类yunzhimodel进行处理。
	 * @param  int $beginTime 开始日期:date_to_int(时间戳)
	 * @param  int $endTime   结束日期:date_to_int(时间戳)
	 * @return lists            
	 */
	public function getOrderedListsInDateRange($beginTime, $endTime)
	{
		$map = $this->_queryInit($beginTime, $endTime);

		$lists = $this->getLists(array(), $map);
		return $lists;
	}
	/**
	 * 取出区间内所有房型的预订信息,包括剩余间数
	 * @param  int $beginTime 开始日期:date_to_int(时间戳)
	 * @param  int $endTime   结束日期:date_to_int(时间戳)
	 * @return lists
	 */
	public function getAllOrderedListsInDateRange($beginTime, $endTime)
	{
		$map = $this->_queryInit($beginTime, $endTime);

		$lists = $this->getAllLists(array(), $map);
		
		return $lists;
	}

	private function _queryInit($beginTime, $endTime)
	{
		$beginTime 	= (int)$beginTime;
		$endTime 	= (int)$endTime;

		//大小不满足条件，则进行互换
		if ($endTime < $beginTime)
		{
			$temp 		= $endTime;
			$endTime 	= $beginTime;
			$beginTime 	= $temp;
		}

		//依次取出某房型在日期区间内的已售及未售间数
		//以下两种情况，房间被占用
		//1.已预订入住时间 <  请求入住时间 同时 已预订退房时间 > 请求入住时间
		//2.已预订入住时间 >= 请求入住时间 同时 已预订入住间 < 请求退房时间
		$map = array();
		$map['_string'] 	= "(`begin_time` < '$beginTime' AND `end_time` > '$beginTime') OR (`begin_time` >= '$beginTime' AND `begin_time` < '$endTime')"; 

		return $map;
	}

	/**
	 * 取消ID为传入值的订单信息
	 * @param  int $id     
	 * @param  int $userId 操作用户ID
	 * @return this         
	 */
	public function cancelListById($id, $userId = null)
	{
		$id = (int)$id;

		//当未传入用户信息时，取当前用户信息
		if (!isset($userId))
		{
			$userId = get_user_id();
		}

		//更新订单表
		$data 					= array();
		$data['id'] 			= $id;
		$data['cancel_time'] 	= time();	//取消时间
		$data['is_cancel'] 		= 1;		//取消标志
		$data['cancel_user_id']	= $userId;	//取消用户ID
		if (!$this->saveList($data))
		{
			$this->setError("Id:$id is not found or the order is canceled.(ID为$id的记录未找到，或找到的记录的状态本就是取消的)" . $this->getError());
		}
		return $this;
	}

	/**
	 * 获取某个用户近三个月的订单信息
	 * @return lists [description]
	 */
	public function getListsByCustomerId($customerId)
	{
		$customerId = (string)trim($customerId);
		if (strlen($customerId) !== 28)
		{
			$this->setError("用户ID的长度不符合要求");
			return false;
		}

		$time = time() - 90*24*60*60;
		$map = array();
		$map['customer_id'] = $customerId;
		$map['order_time'] = array('EGT', $time);
		$lists = $this->getAllLists(array(), $map);
		if ($lists === false)
		{
			$this->setError("OrderLogic Error: getListsByCustomerId has errors.Msg:" . $this->getError());
			return false;
		}

		return $lists;
	}

	/**
	 * 判断订单状态是否为可支付状态
	 * 可支付状态需要满足.
	 * 1.当前订单的入住时间不大于当前时间（均取0点信息）
	 * 2.当前订单所选择的房型及间数处于可预订的状态	
	 * @return 成功，返回订单数据信息 失败：返回false
	 * panjie
	 * 2016.01
	 */
	public function checkOrderCanBePayById($id)
	{
		if (!$order = $this->getListById($id))
		{
			$this->setError("OrderLogic::checkOrderCanBePayById error:" . $this->getError());
			return false;
		}

		//看支付状态是否为已支付
		if ($order['is_pay'] == "1")
		{
			$this->setError("订单已支付，请勿重复支付。");
			return false;
		}
		$beginTime = $order['begin_time'];
		$endTime = $order['end_time'];
		$time = strtotime(date("Y-m-d"));

		if ($time > $beginTime)
		{
			$this->setError("当前订单的入住时间已过期。");
			return false;
		}

		//取房型信息
		$RoomL = new RoomLogic();
		if (!$room = $RoomL->getListById($order['room_id']))
		{
			$this->setError("OrderL::checkOrderCanBePayById Error:" . $RoomL->getError());
			return false;
		}
		if ($room['status'] == '1')
		{
			$this->setError("对不起，当前房型已取消预订。");
			return false;
		}

		//取出当前房型在日期区间内的已售数量
		//以下两种情况，房间被占用
		//1.已预订入住时间 <  请求入住时间 同时 已预订退房时间 > 请求入住时间
		//2.已预订入住时间 >= 请求入住时间 同时 已预订入住间 < 请求退房时间
		$map = array();
		$map['_string'] 	= "(`begin_time` < '$beginTime' AND `end_time` > '$beginTime') OR (`begin_time` >= '$beginTime' AND `begin_time` < '$endTime')"; 
		$map['room_id'] 	= $order['room_id'];
		$map['is_pay']		= 1;
		$map['is_cancel'] 	= 0;
		
		$orderedNum = $this->where($map)->count();
		$canOrderedNum = (int)$room["total_rooms"] - (int)$orderedNum;
		if ($canOrderedNum < $order['count'])
		{
			$this->setError("对不起，您所预订的房型数量不足。");
			return false;
		}

		$order["_room"] = $room;
		return $order;
	}

	public function setIsPayById($id)
	{
		$data['id'] = $id;
		$data['is_pay'] = 1;
		$this->saveList($data);
		return;
	}
}