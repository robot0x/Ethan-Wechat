<?php
/**
 * 活动管理
 * panjie
 */
namespace Activity\Logic;

use Activity\Model\ActivityModel;

class ActivityLogic extends ActivityModel
{
	/**
	 * 获取状态为正常的活动信息
	 * @param  int $id 
	 * @return list 
	 */
	public function getNormalListById($id)
	{
		$id = (int)$id;
		$list = $this->getListById($id);

		//排错
		if(count($this->getErrors()) > 0)
		{
			return false;
		}

		//去除记录为空或状态为冻结的记录
		if($list === null || $list['status'] == '1')
		{
			$this->error = "activityConError: the list of $id is not exist, or the list is freezed!";
			return false;
		}

		return $list;
	}
}