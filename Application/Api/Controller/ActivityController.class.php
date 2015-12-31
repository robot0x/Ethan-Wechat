<?php
/**
 * 活动管理
 * panjie
 */
namespace Api\Controller;

use Activity\Logic\ActivityLogic;

class ActivityController extends ApiController
{
	/**
	 * 获取活动列表
	 * @return jsonLists
	 */
	public function getActivitysAction()
	{
		$this->ajaxReturn($this->getActivitys());
	}

	/**
	 * 获取活动列表
	 * @return lists
	 */
	public function getActivitys()
	{
		$ActivityL = new ActivityLogic();

		//设置查询条件
		$maps = array("status"=>"0");
		$ActivityL->setMaps($maps);

		//设置取回字段
		$fields = array("id","end_time","title","thumbnails_url");
		$ActivityL->setBackFields($fields);

		//取LISTS
		$activeties = $ActivityL->getLists(); 

		//拼接返回数据
		$data = array("status"=>"success");
		$data["data"] = $activeties;

		//返回值
		return $data;
	}

	/**
	 * 获取活动详情
	 * panjie
	 * @return ajaxList 
	 */
	public function getActivityDetailAction()
	{
		$this->ajaxReturn($this->getActivityDetail());
	}

	/**
	 * 获取活动详情
	 * panjie
	 * @return list 
	 */
	public function getActivityDetail()
	{
		//返回值初始化
		$data = array("status"=>"error");

		//实例化
		$ActivityL = new ActivityLogic();

		//返回数据，则返回正常。返回错误，则返回报错信息
		if ($activity = $ActivityL->getNormalListById(I('get.id')))
		{
			$data['status'] = "success";
			$data['data'] = $activity;
		}
		else
		{
			$data['message'] = "ActivityConError: " . $ActivityL->getError();
		}

		return $data;
	}
}