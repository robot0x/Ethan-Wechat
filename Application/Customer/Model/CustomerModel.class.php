<?php
namespace Customer\Model;

use Yunzhi\Model\YunzhiModel;

class CustomerModel extends YunzhiModel {
	
	public function getCustomers(){
		return $this->select();
	}
}