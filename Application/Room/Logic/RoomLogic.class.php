<?php
/**
 * 后台幻灯片管理
 * 魏静云
 */
namespace Room\Logic;

use Room\Model\RoomModel;

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
	public function getAllListsWithTimeRange($beginTime, )
	{
		$lists = $this->getAllLists();

	}
}