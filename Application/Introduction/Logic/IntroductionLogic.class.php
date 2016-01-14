<?php

/**
 * 酒店介绍logic
 * panjie
 */

namespace Introduction\Logic;

use Introduction\Model\IntroductionModel;

class IntroductionLogic extends IntroductionModel
{
	public function saveList($list)
	{
		$data = array();
		if (!$id = (int)$list['id'])
		{
			$this->setError("IntrodctionL:The datas must be have KEY id(必须传入参数ID)");
			return false;
		}

		$data['id'] = $id;
		$data['hotel_phone'] = $list['hotel_phone'];
		$data['description'] = $list['description'];

		return parent::saveList($data);
	}
	/**
	 * 获取一条记录信息
	 * @return list 
	 */

	public function getList()
	{
		return $this->find();
	}
}