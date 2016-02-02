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

    /**
     * 更新用户信息
     * @param   $list 用户信息
     * @return true:$this false 
     */
    public function updateList($list)
    {
        $id = $list["id"];
        if (!(int)$id)
        {
            $this->setError("UserLogic->updateList:Must has key of id.(必须传入ID)");
            return $this;
        } 

        //取当前ID对应的信息
        $user = $this->getListById($id);

        //判断原密码是否正确
        $password = password($list['password']);
        if ($password !== $user['password'])
        {
            $this->setError("UserLogic->updateList:The old password is incorrect.(原密码输入错误)");
            return $this;
        }

        //如果传入的新密码为空，则不重置密码;非空，则重置密码
        $repassword = isset($list['repassword']) ? trim($list['repassword']) : '';
        if ($repassword !== "")
        {
            $user['password'] = password($repassword);
        }

        //取其它更新的数据
        $user['email'] = $list['email'];

        //更新数据
        try
        {
            if ($this->create($user))
            {
                $this->save();
            }
            else
            {   
                $this->setError("UserLogic->updateList:Data create error(数据创建错误):" . $this->getError());
                return $this;
            }
            
        }
        catch(\Think\Exception $e)
        {
            $this->setError("UserLogic->updateList:data save error, msg(数据保存过程中出错，错误信息）:" . $e->getMessage());
            return $this;
        }

        return $this;
        
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