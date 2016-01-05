<?php
/**
 * 酒店介绍logic
 * panjie
 */
namespace Introduction\Logic;

use Introduction\Model\IntroductionModel;

class IntroductionLogic extends IntroductionModel
{
	/**
	 * 获取一条记录信息
	 * @return list 
	 */
	public function getList()
	{
		return $this->find();
	}
}