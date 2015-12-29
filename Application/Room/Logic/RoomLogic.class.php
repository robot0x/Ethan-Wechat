<?php
/**
 * 后台幻灯片管理
 * 魏静云
 */
namespace Room\Logic;

use Room\Model\RoomModel;

class RoomLogic extends RoomModel
{
	public function addList($list)
	{
		dump($list);
		try{
			if($this->create($list))
			{
				$id = $this->add();
				return $id;
			}
			else
			{
				$this->setError("data create error");

				return false;
			}
		}
		catch(\Think\Exception $e)
		{
			$this->setError($e->getMessage());
			return false;
		}
	}

	public function saveList($list){
		try{
			if($this->create($list))
			{

				$id=$this->save();
				return $id;
			}
			else
			{
				$this->errors[]=$this->getErrors();
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
		$map['id'] = $id;
		$datas=$this->where($map)->delete();
		return $datas;
	}
}