<?php
/**
 * 后台幻灯片管理
 * 魏静云
 */
namespace Room\Logic;

use Room\Model\RoomModel;

class RoomLogic extends RoomModel
{
	public function saveList($list)
	{
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
}