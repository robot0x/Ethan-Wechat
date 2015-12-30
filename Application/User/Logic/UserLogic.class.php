<?php

namespace User\Logic;

use User\Model\UserModel;

class UserLogic extends UserModel
{
	protected  $errors = array();

    public function getErrors()
	{
		return $this->errors;
	}

   	public function addList($list)
	{
		try
		{
			if($this->create($list))
			{
				$id = $this->add();
				return $id;
			}
			else
			{
				$this->errors[] = $this->getError();
				return false;
			}
		}
		catch(\Think\Exception $e)
		{
			$this->errors[] = $e->getMessage();
			return false;
		}
	}

    public function saveList($list)
    {
    	try
    	{
    		if ($this->create($list))
    		{
    			$id = $this->save();
    			return $id;
    		}
    		else
    		{
    			$this->errors[] = $this->getError();
    			return false;
    		}
    	}
    	catch(\Think\Exception $e)
    	{
    		$this->errors[] = $e->getMessage();
    		return false;
    	}
    }

    public function deleteInfo($id)
	{
		$map['id'] = $id;
		$datas=$this->where($map)->delete();
		return $datas;
	}

	// public function getSearchLists()
	// {
	// 	//去空格
	// 	$keywords = trim(I('get.keywords'));

	// 	//判断是否为空
	// 	try
	// 	{
	// 	    if ($keywords!=="")
	// 	    {
	// 		    $map['name'] = array('like','%'.$keywords.'%');
	// 		    import('ORG.Util.Page');// 导入分页类

	// 		    $lists=$this->page($_GET['p'],$pagesize)->where($map)->select();
	// 		    return $lists;
	// 	    }
	// 	    else
	// 	    {
	// 		    $lists = $this->page($_GET['p'],$pagesize)->select();
	// 		    return $lists;
	// 	    }
	//     }
	// 	catch(\Think\Exception $e)
	// 	{
	// 		$this->errors[]=$e->getMessage();
	// 		return false;
	// 	}
	// }

}