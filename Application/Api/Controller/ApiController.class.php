<?php
namespace Api\Controller;

use Think\Controller;
use Api\Controller\JssdkController;
use Api\Controller\SlideShowController;
use Api\Controller\IntroductionController;
use Api\Controller\RoomController;
use Api\Controller\EvaluationController;

class ApiController extends Controller
{
	/*
	
	 */
	public function getJssdkAction(){
		$jssdk = new JssdkController("wxc92a0067c6338cbf", "bb721eba1ceb506c78f46aa9451e2104");
		$signPackage = $jssdk->GetSignPackage();
		var_dump($signPackage);
	}	
	/**取首页的信息
	 * xulinjie
	 * @return ajaxlist
	 */
	public function getSlideInitAction()
	{
		$SlideShow = new SlideShowController();
		//获取首页幻灯片和首页地图的url
		$slideUrls = $SlideShow->getSlideUrls();
		$slideMapUrl = $SlideShow->getSlideMapUrl();

		//取房间信息
		$SlideRoom = new RoomController();
		$slideRoomLists = $SlideRoom->getRooms();
		//room增加一个字段detail=‘false’
		foreach ($slideRoomLists['data'] as $key => $value) {
			$slideRoomLists['data'][$key]['detail'] = false;
			$slideRoomLists['data'][$key]['order'] = '#/tab/confirmOrder';
		}

		//拼接数组
		$data['slideUrls'] = $slideUrls;
		$data['slideMapUrl'] = $slideMapUrl;
		$data['rooms'] = $slideRoomLists;

		$this->ajaxReturn($data);
	}
	/**
	 * 取酒店介绍的信息
	 * xulinjie
	 * @return ajaxlist
	 */ 
	public function getHotelIntroductionAction()
	{
		$Introduction = new IntroductionController();
		$introduction = $Introduction->getHotalIntroduction();

		$this->ajaxReturn($introduction);
	}
	public function getEvaluationAction()
	{
		$Evaluations = new EvaluationController();
		$evaluations = $Evaluations->getEvaluations();

		foreach ($evaluations['data'] as $key => $value) {
			$count = $evaluations['data'][$key]['star_level'];
			$evaluations['data'][$key]['icon'] = array_fill(0, $count, 'ion-iconfontunie616');
			// $evaluations['data'][$key]['icon'] = array_fill($count-1, 5-$count, 'ion-iconfontunie614');


		}
		$this->ajaxReturn($evaluations);
	}
}