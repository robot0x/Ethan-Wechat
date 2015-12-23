<?php
/**
 * 菜单管理logic
 */
namespace Menu\Logic;

use Menu\Model\MenuModel;

class MenuLogic extends MenuModel
{
	public function getListByIsDev($IsDev = null)
	{
		$map = array();
		if ($IsDev !== null)
		{
			$map['is_dev'] = $IsDev;
		}
		return $this->getMenuTree(null,$map,1,2);
	}
}