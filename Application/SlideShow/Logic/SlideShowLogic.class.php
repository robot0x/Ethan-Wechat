<?php
/**
 * 后台幻灯片管理
 * 魏静云
 */
namespace SlideShow\Logic;

use SlideShow\Model\SlideShowModel;

class SlideShowLogic extends SlideShowModel
{
	/**
	 * 获取状态为正常的所有记录
	 * panjie
	 * @return lists 
	 */
	public function getNormalLists()
	{
		$maps['status'] = 0;
		$this->setMaps($maps);
		$lists = $this->getAllLists();
		// echo $this->getLastSql();
		return $lists;
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