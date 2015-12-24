<?php
/**
 * admin 根类
 */
namespace Admin\Model\Admin;

use Menu\Logic\MenuLogic; 	//菜单

class ConstructModel
{
	protected $menuLists; //菜单列表

	public function getMenuLists()
	{
		$MenuL = new MenuLogic();
		$menus = $MenuL->getListByIsDev();
		return $menus;
	}
}