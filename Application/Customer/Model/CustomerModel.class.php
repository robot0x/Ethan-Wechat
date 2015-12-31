<?php
namespace Customer\Model;

use Yunzhi\Model\YunzhiModel;

class CustomerModel extends YunzhiModel {
	
	public function getCustomers(){
		$map = array();
		$map['is_subscribe'] = 1;
		return $this->where($map)->select();
	}
}