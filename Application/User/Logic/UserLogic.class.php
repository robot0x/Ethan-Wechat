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

   
    public function saveList($list)
    {
    	try
    	{
    		if ($this->create($list))
    		{
    			if(isset($this->data['id']) && $this->data['id'] !== "")
    			{
    				$id = $this->save();
    			}
    			else
    			{
    				$id = $this->add();
    			}
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

    /**
     * 通过ID获取用户的NAME值
     * @param  int $id 
     * @return list OR FALSE
     * PANJIE
     */
    public function getNameById($id)
    {
        $id = (int)$id;
        $map = array();
        $map["id"] = $id;
        if (!$list = $this->getListById($id))
        {
            $this->setError("UserLogic:The data of id:$id is not found(编号为$id的记录未找到:)" . $this->getError());
            return false;
        }

        return $list['name'];
    }

}