<?php

/**
 * 活动管理
 * panjie
 */

namespace Activity\Logic;

use Activity\Model\ActivityModel;

class ActivityLogic extends ActivityModel
{

	protected $errors = array();   //错误信息

	public function getErrors()
	{
		return $this->errors;
	}
	public function addList($activity)			//添加活动
	{
		try{
			if($this->create($activity))
			{
				$id=$this->add();
				return $id; 
			}
			else
			{
				$this->errors[]=$this->getError();
				return false;
			}
		}
		catch(\Think\Exception $e)
		{
			$this->errors[]=$e->getMessage();
			return false;
		}
	}
	public function saveList($activity)          //编辑后的保存活动
	{
		try{
			if($this->create($activity))
			{
				$id=$this->save();
				return $id;
			}
			else
			{
				$this->errors[]=$this->getError();
				return false;
			}
		}
		catch(\Think\Exception $e)
		{
			$this->errors[]=$e->getMessage();
			return false;
		}
	}
	public function deleteInfo($id)       //删除活动
	{
		$map['id']=$id;
		$datas=$this->where($map)->delete();
		dump($datas);
		return $datas;
	}

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