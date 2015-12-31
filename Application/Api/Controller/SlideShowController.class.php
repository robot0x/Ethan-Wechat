<?php
/**
 * 首页幻灯片轮播API
 * panjie
 * 2015-12-31
 */
namespace Api\Controller;

use SlideShow\Logic\SlideShowLogic;			//幻灯片

class SlideShowController extends ApiController
{
	/**
	 * 获取幻灯片列表
	 * panjie
	 * @return jsonLists 
	 */
	public function getSlideUrlAction()
	{
		return $this->ajaxReturn($this->getSlideUrl());
	}

	/**
	 * 获取幻灯片列表
	 * panjie
	 * @return lists 
	 */
	public function getSlideUrl()
	{
		//实例化幻灯片
		$SlideShowL = new SlideShowLogic();
		$slideshows = $SlideShowL->getNormalLists();

		//抓取出：存在URL值而且不是首页地图信息的信息，并返回
		$datas = array();
		foreach($slideshows as $key => $value)
		{
			if ($value['url'] !== '' && $value['is_map'] == '0')
			{
				$datas['url'] = $value['url'];
			}
		}

		return $datas;
	}

	/**
	 * 获取首地地图图片
	 * panjie
	 * @return json 
	 */
	public function getSlideMapUrlAction()
	{
		$this->ajaxReturn($this->getSlideMapUrl());
	}	

	/**
	 * 获取首页地图图片信息
	 * panjie
	 * @return list 
	 */
	public function getSlideMapUrl()
	{
		//实例化幻灯片
		$SlideShowL = new SlideShowLogic();
		$slideshows = $SlideShowL->getNormalLists();

		//抓取出：存在URL值 而且 是首页地图信息的信息，中断并返回
		$data = array();
		foreach($slideshows as $key => $value)
		{
			if ($value['url'] !== '' && $value['is_map'] == '1')
			{
				$data['url'] = $value['url'];
				break;
			}
		}
		return $data;
	}


}