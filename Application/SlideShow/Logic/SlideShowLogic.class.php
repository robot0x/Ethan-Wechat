<?php
namespace SlideShow\Logic;

use SlideShow\Model\SlideShowModel;

class SlideShowLogic extends SlideShowModel
{
	protected  $errors = array();

	public function getErrors()
	{
		return $this->errors;
	}
	public function addList($slideshow)
	{
		try{
			if($this->create($slideshow))
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
	public function saveList($list){
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
		$map['id'] = $id;
		$datas=$this->where($map)->delete();
		return $datas;
	}
}