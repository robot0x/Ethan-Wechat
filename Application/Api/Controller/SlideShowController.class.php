<?php
/**
 * 首页幻灯片轮播API
 * panjie
 * 2015-12-31
 */
namespace Api\Controller;

use SlideShow\Logic\SlideShowLogic;

class SlideShowController extends ApiController
{
	public function getSlideUrlAction()
	{
		return $this->ajaxReturn($this->getSlideUrl());
	}

	public function getSlideUrl()
	{
		$SlideShowL = new SlideShowLogic();
		$slideshows = $SlideShowL->getNormalLists();

		$datas = array();
		foreach($slideshows as $key => $value)
		{
			if ($value['url'] !== '')
			{
				$datas[] = $value['url'];
			}
		}
		return $datas;
	}
}