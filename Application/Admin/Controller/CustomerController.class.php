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

	public function synchroAction(){
		//调用接口获取客户信息
		$CustomerL = new CustomerLogic;
		$lists = $CustomerL->getCustomerList();

		//遍历用户列表依次取数据
		$customers = array();
		foreach ($lists['data']['openid'] as $key => $value) {
			$customers[] = $CustomerL->getCustomerInfo($value);
		}

		//与数据库的数据同步
		$result = $CustomerL->synchro($customers);
		$this->success("新增".$result['add']."条数据，修改".$result['save']."条数据",U('index'));
	}

	public function freezenAction(){
		$openid = I("get.openid");
		$CustomerL = new CustomerLogic;
		$CustomerL->freezen($openid);
		$this->success("",U('index'));
	}	
}