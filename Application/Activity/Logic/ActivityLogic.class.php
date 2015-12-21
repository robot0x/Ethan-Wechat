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
	public function addList($activity)
	{
		try{
			if($this->creat($activity))
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
	public function saveList($list)
	{
		try{
			if($this->create($list))
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
	public function deleteInfo($id)
	{
		$map['id']=$id;
		$datas=$this->where($map)->delete();
		return $datas;
	}



}