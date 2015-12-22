<?php
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



}