<?php
namespace Api\Controller;

use Think\Controller;
use Api\Controller\JssdkController;
use Api\Controller\SlideShowController;
use Api\Controller\IntroductionController;
use Api\Controller\RoomController;
use Api\Controller\EvaluationController;
use Api\Controller\ActivityController;

class ApiController extends Controller
{
	public function __construct()
	{
		parent::__construct();
		session(array('expire'=>360000));//设置过期时间100小时
	}
	/*
	
	 */
	public function getJssdkAction(){
		$jssdk = new JssdkController("wxd12416985ed20895", "66c26a7146a9978c59c18dc28147d65b");
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
		//room增加一个字段detail = false;
		foreach ($slideRoomLists['data'] as $key => $value) {
			$slideRoomLists['data'][$key]['detail'] = false;
			$slideRoomLists['data'][$key]['order'] = '#/confirmOrder/'.$slideRoomLists['data'][$key]['id'];
		}

		//取酒店详细信息
		$Introduction = new IntroductionController();
		$introduction = $Introduction->getHotalIntroduction();

		//取活动信息
		$Activity = new ActivityController();
		$activitys = $Activity->getActivitys();

		//拼接数组
		$data['slideUrls'] = $slideUrls;
		$data['slideMapUrl'] = $slideMapUrl;
		$data['rooms'] = $slideRoomLists;
		$data['introduction'] = $introduction;
		$data['activitys'] = $activitys;

		$this->ajaxReturn($data);
	}

	/**
	 * 取评价信息
	 * xulinjie
	 * @return ajaxlists
	 */
	public function getEvaluationAction()
	{
		$Evaluations = new EvaluationController();
		$evaluations = $Evaluations->getEvaluations();

		
		foreach ($evaluations['data'] as $key => $value) {
			$count = $evaluations['data'][$key]['star_level'];
			$evaluations['data'][$key]['icon'] = array_fill(0, $count, 'ion-iconfontunie614');
			//$evaluations['data'][$key]['icon'] = array_fill($count, 5-$count, 'ion-iconfontunie616');
			if ($count !== 5) {
				for ($i=0; $i < 5-$count; $i++) { 
					array_push($evaluations['data'][$key]['icon'], 'ion-iconfontunie616');
				}
			}
		}

		
		$this->ajaxReturn($evaluations);
	}

	/**
	 * 获取新的房间信息
	 * xulinjie
	 * @return 
	 */
	public function getNewRoomsAction()
	{
		$Room = new RoomController();
		$roomLists = $Room->getRooms();
		$this->ajaxReturn($roomLists);
	}

	/**
	 * 取填写订单的信息
	 * xulinjie
	 * @return 
	 */
	public function getConfirmOrderAction()
	{
		$Room = new RoomController();
		$roomList = $Room->getRoomList();
		$this->ajaxReturn($roomList);
	}
}