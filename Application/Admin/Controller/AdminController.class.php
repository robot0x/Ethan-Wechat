<?php
namespace Admin\Controller;

use Think\Controller;

class AdminController extends Controller
{
	public function __construct()
	{
		parent::__construct();

		//取左侧菜单
		$tpl = T("Admin@Admin/left");
		$YZ_TEMPLATE_LEFT = $this->fetch($tpl);
		$this->assign("YZ_TEMPLATE_LEFT", $YZ_TEMPLATE_LEFT);
	}
}
