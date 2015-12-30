<?php
/**
 * 客户管理类
 */
namespace Admin\Controller;

use Admin\Controller\AdminController;
use Customer\Model\CustomerModel;
use Customer\Logic\CustomerLogic;

class CustomerController extends AdminController {

	public function indexAction(){

		$CustomerM = new CustomerModel;
		$this->assign('M',$CustomerM);
		$this->display();
	}
}