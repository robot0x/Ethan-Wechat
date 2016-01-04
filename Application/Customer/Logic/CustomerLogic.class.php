<?php
/**
 * 客户
 * panjie
 */
namespace Customer\Logic;

use Customer\Model\CustomerModel;

class CustomerLogic extends CustomerModel {

	/**
	 * TO：邓浩洋：
	 * 	这个写的有问题！
	 * 1.getLists方法在yunzhiModel中存在.
	 * 2.select()未分页。有10000条记录，全部返回不成？
	 */
	public function getLists(){
		return $this->select();
	}

	/**
	 * 通过用户ID获取记录
	 * @param  string $id 28位openid
	 * @return list     
	 */
	public function getListById($id)
	{

		if (strlen(trim($id)) !== 28)
		{
			$this->setError("the length of customer ID $id must be 28 ");
			return false;
		}

		$map['id'] = $id;
		return $this->where($map)->find();
	}

}