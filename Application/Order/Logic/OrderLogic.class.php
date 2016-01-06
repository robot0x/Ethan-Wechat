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
		$map['status'] 		= '0';		//状态为正常
		$map['is_pay'] 		= '1';		//已支付
		$map['is_cancel']	= '0'; 		//未取清

		return $map;
	}

}