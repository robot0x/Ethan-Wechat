<?php
namespace Customer\Logic;

use Customer\Model\CustomerModel;

class CustomerLogic extends CustomerModel {

	public function getLists(){
		return $this->select();
	}

}