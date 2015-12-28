<?php
namespace Admin\Controller;

use Think\Controller;
use Admin\Model\Admin\ConstructModel;

class AdminController extends Controller
{
	public function __construct()
	{
		parent::__construct();

		//取左侧菜单数据
		
		$ConstructM = new ConstructModel();
		$this->assign("M", $ConstructM);

		//取左侧菜单
		$tpl = T("Admin@Admin/nav");
		$YZ_TEMPLATE_NAV = $this->fetch($tpl);
		$this->assign("YZ_TEMPLATE_NAV", $YZ_TEMPLATE_NAV);
	}
}
