<?php
/**
 * 后台幻灯片管理
 * 魏静云
 */
namespace Room\Logic;

use Room\Model\RoomModel;
use Book\Logic\BookLogic;

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
		//取出所有房型
		$lists = $this->getAllLists();
		
		//日期格式化，不成功，则进行当日及次日初始化
		if (!$beginTime = date_to_int($beginTime))
		{
			$beginTime = date_to_int(date("Y-m-d"));
		}

		if (!$endTime = date_to_int($endTime))
		{
			$endTime = $beginTime+24*60*60;
		}

		$BookL = new BookLogic();
		$books = $BookL->getBookedListInDateRange($beginTime, $endTime);

		//todo:依次循环，用房型的总数，减去已预订的数量：得出房型可预订数量
	}
}