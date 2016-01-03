<?php
/**
 * 酒店介绍 controller
 * panjie
 */
namespace Api\Controller;

use Introduction\Logic\IntroductionLogic;

class IntroductionController extends ApiController
{
	/**
	 * 获取酒店介绍信息
	 * panjie
	 * @return ajaxlist
	 */
	public function getHotalIntroductionAction()
	{
		$this->ajaxReturn($this->getHotalIntroduction());
	}

	/**
	 * 获取酒店介绍信息
	 * panjie
	 * @return ajaxlist
	 */
	public function getHotalIntroduction()
	{
		$IntroductionL = new IntroductionLogic();
		$introduction = $IntroductionL->getList();

		$data = array("status"=>"success");
		$data['data'] = $introduction;

		return $data;
	}
}