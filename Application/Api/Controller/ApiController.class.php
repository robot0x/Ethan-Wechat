<?php
namespace Api\Controller;

use Think\Controller;

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
	 * 取活动的详细信息
	 * xulinjie
	 * @return 
	 */
	public function getActivityDetailAction()
	{
		$Activity = new ActivityController();
		$detail = $Activity->getActivityDetail();

		$this->ajaxReturn($detail);
	}
}