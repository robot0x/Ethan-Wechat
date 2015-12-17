<?php
namespace CustomMenu\Logic;

use CustomMenu\Model\CustomMenuModel;

class CustomMenuLogic extends CustomMenuModel
{
	private $EventKey;

	public function setEventKey($key){
		$this->EventKey = $key;
	}

	public function getErrors()
	{
		return $this->errors;
	}

	public function getListById($id)
	{
		$map['id'] = $id;
		$data = $this->where($map)->find();
		return $data;
	}

	public function getListByName($name)
	{
		//判断是否是字符串
		if (is_string($name)!==true) {
			$this->errors[] = "传入变量类型非string";
			return false;
		}

		//去空格
		$name=trim((string)$name, " ");

		
		$map['name'] = $name;
		$data = $this->where($map)->find();
		return $data;
	}

	public function getLists($status=0)
	{
		try
		{
			$lists=$this->select();

			return $lists;
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
		$datas = $this->where($map)->delete();
		return $datas;
	}

	public function addList($list)
	{
		try{
			//将ptitle转换为pid
			$ptitle = $list['pid'];
			$list['pid'] = $this->getListByName($ptitle)['id'];

			if($this->create($list))
			{
				$data = $this->add();

				return $data;
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

	public function getTitles(){
		try 
		{
			$titles = array();
			$data = $this->getLists();
			foreach ($data as $key => $value) {
				$titles[] = $value['name'];
			}
			return $titles;
		}
		catch(\Think\Exception $e)
		{
			$this->errors[]=$e->getMessage();
			return false;
		}
	}

	public function getMenus(){

		try
		{
			$lists=$this->select();

			return $lists;
		}
		catch(\Think\Exception $e)
		{
			$this->errors[]=$e->getMessage();
			return false;
		}
	}

	public function getContent(){
		try
		{
			//取出所有数据
			$lists=$this->select();
			$list = array();	

			//根据key值判断是哪条数据
			foreach ($lists as $key => $value) {
				if($value['keyword'] == $this->EventKey){
					$list = $value;
				}
			}

			switch ($list['fourm_type']) {
				case '1':
					$content = $list['content'];
					break;
				
				case '2':
					$content = array();
					$content[] = array("Title"=>$list['title'],
                               "Description"=>$list['content'],
                               "PicUrl"=>$list['imgurl'],
                               "Url"=>$list['url']);
					break;
			}

			
			//拼接好数组return	
			return $content;
		}
		catch(\Think\Exception $e)
		{
			$this->errors[]=$e->getMessage();
			return false;
		}
	}
}