<?php
/**
 * 后台幻灯片管理
 * 魏静云
 */
namespace SlideShow\Logic;

use SlideShow\Model\SlideShowModel;

class SlideShowLogic extends SlideShowModel
{
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