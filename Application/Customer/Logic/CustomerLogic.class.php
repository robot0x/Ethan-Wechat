<?php
namespace Customer\Logic;

use Customer\Model\CustomerModel;

class CustomerLogic extends CustomerModel {

	public function getLists(){
		return $this->select();
	}

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