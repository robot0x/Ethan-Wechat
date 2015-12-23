<?php
namespace Admin\Controller;

use Think\Controller;

class AdminController extends Controller
{
	public function __construct()
	{
		parent::__construct();

		//取左侧菜单
		$tpl = T("Admin@Admin/nav");
		$YZ_TEMPLATE_NAV = $this->fetch($tpl);
		$this->assign("YZ_TEMPLATE_NAV", $YZ_TEMPLATE_NAV);
	}
}
