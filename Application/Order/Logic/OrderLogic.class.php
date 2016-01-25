<?php
/**
 * 预订信息
 * panjie
 */
namespace Order\Logic;

use Order\Model\OrderModel;

class OrderLogic extends OrderModel
{
	protected $map = array(); //查询附加条件

	/**
	 * 取出区间内的当前页预订信息
	 * 当前页由get.p传入，并由父类yunzhimodel进行处理。
	 * @param  int $beginTime 开始日期:date_to_int(2015-12-31)
	 * @param  int $endTime   结束日期:date_to_int(2016-01-03)
	 * @return lists            
	 */
	public function getOrderedListsInDateRange($beginTime, $endTime)
	{
		$map = $this->_queryInit($beginTime, $endTime);

		$lists = $this->getLists(array(), $map);
		return $lists;
	}
	/**
	 * 取出区间内所有房型的预订信息
	 * @param  int $beginTime 开始日期:date_to_int(2015-12-31)
	 * @param  int $endTime   结束日期:date_to_int(2016-01-03)
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
		if (!$lists = $this->getAllLists(array(), $map))
		{
			$this->setError("OrderLogic Error: getListsByCustomerId has errors.Msg:" . $this->getError());
			return false;
		}

		return $lists;
	}
}